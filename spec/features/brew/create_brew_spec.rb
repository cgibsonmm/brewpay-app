require 'rails_helper'

RSpec.describe 'Create Brew', type: :feature do
  context 'Valid Brewery' do
    before do
      @brewery = create(:brewery)
      login_as(@brewery)
      visit root_path
    end

    it 'Should create a valid brew' do
      @brew = { title: Faker::Beer.name }
      visit new_brewery_brew_path(@brewery)
      fill_in 'Title', with: @brew[:title]
      fill_in 'Description', with: 'Loreum'
      fill_in 'Price', with: '8.00'
      fill_in 'ABV', with: '2.0'
      attach_file('brew_logo', 'spec/files/brew-img.jpg')

      click_on 'Create Brew'

      expect(page).to have_content('Successfully created brew')
      expect(page).to have_content(@brew[:title])
      expect(page).to have_css("img[src*='brew-img.jpg']")
    end
  end

  context 'Brewery not logged in' do
    it 'should redirect to login' do
      visit '/breweries/1/brews/new'
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end
  end
end
