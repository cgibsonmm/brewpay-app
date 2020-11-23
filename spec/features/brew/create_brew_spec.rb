require 'rails_helper'

RSpec.describe 'Create Brew', type: :feature do
  context 'Valid Brewery' do
    before do
      @brewery = create(:brewery)
      login_as(@brewery)
      visit root_path
    end

    it 'Should create a valid brew' do
      visit new_brewery_brew_path(@brewery)
      fill_in 'Title', with: 'new Beer'
      fill_in 'Description', with: 'Loreum'
      fill_in 'Price', with: '8.00'
      fill_in 'ABV', with: '2.0'
      attach_file('brew_logo', 'spec/files/brew-img.jpg')
      click_on 'Create Brew'
      expect(page).to have_content('Successfully created brew')
    end
  end
end
