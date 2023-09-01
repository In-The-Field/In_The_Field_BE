FactoryBot.define do
  factory :mushroom do
    probability { Faker::Number.decimal(l_digits: 2) }
    psychoactive { Faker::Boolean.boolean }
    api_id { Faker::Number.number(digits: 10) }
    common_name { Faker::Lorem.word }
    latin_name { Faker::Lorem.word }
    photo { Faker::Internet.url }
    photo_citation { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
  end
end
