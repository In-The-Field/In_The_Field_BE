# frozen_string_literal: true

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
    @common_name = data[:details][:common_names].to_a.join(', ').empty? ? nil : data[:details][:common_names].to_a.join(', ')
    @latin_name = data[:name]
    @edibility = data[:details][:edibility] ||= nil
    @photo = data[:details][:image][:value] ||= nil
    @photo_citation = data[:details][:image][:citation] ||= nil
    @description = nil_description(data[:details])
    @taxonomyp = data[:details][:taxonomy] ||= nil_taxonomy
    @characteristicp = data[:details][:characteristic].to_h ||= nil_characteristic
    @look_alikep = data[:details][:look_alike].to_a ||= ['nil']
  end

  def nil_description(description_data)
    if description_data.key?(:description)
      if description_data[:description]
        if description_data[:description].key?(:value)
          if description_data[:description][:value].nil?
            description_data[:description][:value] = 'nil'
          else
            description_data[:description][:value]
          end
        else
          description_data[:description][:value] = 'nil'
        end
      else
        description_data[:description]
      end
    else
      description_data[:description][:value] = 'nil'
    end
  end

  def nil_taxonomy
    {
      genus: 'nil',
      order: 'nil',
      family: 'nil',
      phylum: 'nil',
      kingdom: 'nil'
    }
  end

  def nil_characteristic
    {
      'hymenium type' => 'nil',
      'stipe character' => 'nil',
      'spore print color' => 'nil',
      'mushroom cap shape' => 'nil',
      'hymenium attachment' => 'nil',
      'mushroom ecological type' => 'nil'
    }
  end
end
