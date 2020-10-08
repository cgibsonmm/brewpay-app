require 'rails_helper'

RSpec.describe "Home Page", type: :feature do
  it"Should render" do
    visit '/'
    expect(page).to have_title('BrewPay')
    
  end
end