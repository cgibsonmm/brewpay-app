require 'rails_helper'

RSpec.describe 'Basic pricing sub', type: :feature do
  before do
    @brewery = create(:brewery)
    login_as(@brewery)
    visit root_path
  end

  context 'valid' do
    it 'should allow a brewery to sign up for a subscription' do
      click_on 'Pricing'
      click_button '$99.99'
      expect(current_path).to eq('/pricing/basic')
      expect(title).to eq('BrewPay | Pricing')
    end
  end
end