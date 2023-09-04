# frozen_string_literal: true

class KindwiseService
  def conn
    Faraday.new(url: 'https://mushroom.kindwise.com/api/v1/identification') do |f|
      f.headers['Api-Key'] = ENV['KINDWISE_API']
      f.headers['Content-Type'] = 'application/json'
    end
  end

  def get_mushroom_data(base_64_image)
    payload = {
      images: [base_64_image]
    }

    response = conn.post do |req|
      req.headers['Api-Key'] = ENV['KINDWISE_API']
      req.body = payload.to_json
      req.params['details'] = 'common_names,description,edibility,image,taxonomy,psychoactive,characteristic,look_alike'
    end

    if response.body == "Invalid image data"
      data = "Invalid image data"
    elsif response.body == "The specified api key does not have sufficient number of available credits."
      data = "1"
    elsif response.body == "The specified api key not found."
      data = "2"
    else
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end

