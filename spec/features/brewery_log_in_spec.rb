require 'rails_helper'

RSpec.describe 'Brewery Login', type: :feature do
  before do
    @brewery = build(:brewery, password: '1234567')
    @brewery.save
    visit 'breweries/sign_in'
  end

  context 'correct info' do
    it "should login" do
      fill_in 'Email', with: @brewery.email
      fill_in 'Password', with: @brewery.password
      click_on "Log in"

      expect(page).to have_content("Signed in successfully")
    end
  end

  context 'incorrect info' do
    it 'should require an email' do
      fill_in 'Email', with: ''
      fill_in 'Password', with: @brewery
      click_on 'Log in'

      expect(page).to have_content('Invalid Email or password')
    end

    it 'should require a password' do
      fill_in 'Email', with: @brewery.email
      fill_in 'Password', with: ''
      click_on 'Log in'

      expect(page).to have_content('Invalid Email or password')
    end
  end
end