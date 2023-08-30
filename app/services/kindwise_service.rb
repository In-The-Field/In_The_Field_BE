class KindwiseService 

  def conn
    Faraday.new(url: "https://mushroom.kindwise.com/api/v1/identification") do |f|
      f.headers['Api-Key'] = ENV['KINDWISE_API']
      f.headers['Content-Type'] = 'application/json'
    end
  end

  def get_mushroom_data(base_64_image)
    payload = {
      images: [base_64_image],  # Wrap the image in an array
      # latitude: 49.207,
      # longitude: 16.608,
      # similar_images: true
    }

    response = conn.post do |req|
      req.headers['Api-Key'] = ENV['KINDWISE_API']  # Make sure the API key is set in the headers
      req.body = payload.to_json
      req.params['details'] = 'common_names,description,edibility,image,taxonomy,psychoactive,characteristic,look_alike,description'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
