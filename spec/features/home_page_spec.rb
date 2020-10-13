require 'rails_helper'

RSpec.describe "Home Page", type: :feature do

  before do 
    visit '/'
  end
  it"Should render" do
    expect(page).to have_title('BrewPay')
    expect(page).to have_selector('h1', text: 'BrewPay')
  end

  it 'should have a Learn More Button' do
    expect(page).to have_button('Learn More')
  end
end