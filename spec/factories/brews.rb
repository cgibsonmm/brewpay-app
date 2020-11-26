FactoryBot.define do
  factory :brew do
    title { Faker::Beer.name }
    description { Faker::Lorem.sentence(word_count: 6) }
    price { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
    ABV { Faker::Number.decimal(l_digits: (1..2).to_a.sample, r_digits: 2) }
    brewery { create(:brewery) }
  end
end
