require 'rails_helper'

RSpec.describe "Navbar Dropdown", type: :feature, js: true do
  context 'width sm' do
    before do
      page.driver.browser.manage.window.resize_to(500, 1000)
      visit '/'
    end
    it 'should have a hamburger menu' do
      expect(page).not_to have_css("#dropdown")
      find("#hamburger").click
      expect(page).to have_css("#dropdown")
    end

    it 'should have login link' do
      find("#hamburger").click
      @dropdown = find('#dropdown')
      expect(@dropdown).to have_button("Brewery Login")
      expect(@dropdown).to have_button("Brewery Sign Up")
    end

    context 'logged in' do
      it 'should have a logout button' do
        @brewery = create(:brewery)
        login_as(@brewery)
        visit root_path
        find("#hamburger").click
        expect(page).to have_button("Logout")
        click_on("Logout")
        expect(page).to have_content('Signed out successfully')
      end
    end
  end

  context 'width md' do
    it 'should not have a hamburger button' do
      page.driver.browser.manage.window.resize_to(767, 1000)
      visit '/'
      expect(page).not_to have_css("#dropdown")
      expect(page).not_to have_button("#hamburger")
    end
  end
end