FactoryBot.define do
  factory :brewery do
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    street_address {Faker::Address.street_address}
    city {Faker::Address.city}
    zip_code {Faker::Address.zip_code}
    state {Faker::Address.state_abbr}
    country {Faker::Address.country_code}
  end
end