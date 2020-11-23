FactoryBot.define do
  factory :brew do
    title { "MyString" }
    description { "MyText" }
    price { 1 }
    ABV { 1 }
    brewery { nil }
  end
end
