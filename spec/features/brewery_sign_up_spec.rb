require 'rails_helper'

RSpec.describe 'Brewery Sign Up', type: :feature do
  it 'should render sign up page' do
    visit '/'
    click_on 'Brewery Sign Up'
    expect(page.current_path).to eq('/breweries/sign_up')
  end

  context 'not signed up' do
    before do
      visit 'breweries/sign_up'
    end
    it 'should let a brewery create a new account' do
      @brewery = {
        email: Faker::Internet.email,
        password: '1234567',
        street_address: Faker::Address.street_address,
        city: Faker::Address.city,
        zip_code: Faker::Address.zip_code,
        state: Faker::Address.state_abbr,
        country: Faker::Address.country_code
      }

      fill_in 'Email', with: @brewery[:email]
      fill_in 'Street address', with: @brewery[:street_address]
      fill_in 'Zip code', with: @brewery[:zip_code]
      fill_in 'City', with: @brewery[:city]
      fill_in 'State', with: @brewery[:state_abbr]
      fill_in 'Country', with: @brewery[:country]
      fill_in 'Password', with: @brewery[:password]
      fill_in 'Password confirmation', with: @brewery[:password]

      click_on 'Sign up'

      expect(current_path).to eq('/')
      expect(page).to have_content('Welcome! You have signed up successfully')
    end
  end
end