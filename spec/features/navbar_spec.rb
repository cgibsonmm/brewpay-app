require 'rails_helper'

RSpec.describe "Navbar", type: :feature do

  before do
    visit '/'
    @nav = find('#navbar')
  end

  it('should render') do
   expect(@nav).to have_content("BrewPay")
  end

  context('not logged in') do
    it('should have a log in button') do
      expect(@nav).to have_button('Brewery Login')
      expect(@nav).to have_button('Brewery Sign Up')
      expect(@nav).not_to have_button('Logout')
    end
  end

  context('logged in') do
    before do
      @brewery = create(:brewery)
      login_as(@brewery)
    end
    it('should have a logout button') do 
      visit '/'
      expect(@nav).not_to have_button('Brewery Login')
      expect(@nav).to have_button('Logout')
    end
  end
  
end