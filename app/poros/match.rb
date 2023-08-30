class Match
  attr_reader :api_id,
              :probability,
              :edibility,
              :taxonomy,
              :psychoactive,
              :characteristic,
              :description,
              :common_name,
              :latin_name,
              :photo,
              :photo_citation,
              :look_alike


  def initialize(data)
    # @access_token = access_token
    @probability = format_probability(data[:probability])

    @psychoactive = data[:details][:psychoactive]

    @api_id = data[:id] 
    @common_name = data[:details][:common_names].first
    @latin_name = data[:name]
    @edibility = data[:details][:edibility]
    @photo = data[:details][:image][:value]
    @photo_citation = data[:details][:image][:citation]
    @description = data[:details][:description][:value]

    @taxonomy = data[:details][:taxonomy]
    @characteristic = data[:details][:characteristic]
    @look_alike = data[:details][:look_alike]
    # require 'pry'; binding.pry
    # @look_alike = format_look_alike(data[:details][:look_alike])
  end

  def format_probability(probability_float)
    probability = (probability_float * 100).round.to_i
    if probability == 100
      probability = 99
    end
    probability
  end

  def format_look_alike(look_alike_data)
    # names = look_alike_data.map do |look_alike|
    #   require 'pry'; binding.pry
    #   look_alike[:name]  
    # end
    # look_alike_names.join(", ")
    # require 'pry'; binding.pry
    names = look_alike_data.map { |look_alike| look_alike[:name] }
    result = names.join(', ')
  end
  
end