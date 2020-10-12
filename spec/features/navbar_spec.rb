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
      expect(@nav).not_to have_button('Logout')
    end
  end

  context('logged in') do
    xit('should have a logout button') do 
      expect(@nav).not_to have_button('Brewery Login')
      expect(@nav).to have_button('Logout')
    end
  end
  
end