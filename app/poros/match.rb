class Match
  attr_reader :api_id,
              :probability,
              :edibility,
              :taxonomyp,
              :psychoactive,
              :characteristicp,
              :description,
              :common_name,
              :latin_name,
              :photo,
              :photo_citation,
              :look_alikep


  def initialize(data)
    @probability = data[:probability]
    @psychoactive = data[:details][:psychoactive]
    @api_id = data[:id] 
    @common_name = data[:details][:common_names].to_a.deep_dup.join(", ")
    @latin_name = data[:name]
    @edibility = data[:details][:edibility]
    @photo = data[:details][:image][:value]
    @photo_citation = data[:details][:image][:citation]
    @description = data[:details][:description][:value]
    @taxonomyp = data[:details][:taxonomy]
    @characteristicp = data[:details][:characteristic].to_h.deep_dup
    @look_alikep = data[:details][:look_alike].to_a.deep_dup
  end  
end