require 'rails_helper'

RSpec.describe 'Brewery Sign Up', type: :feature do
  it 'should let a brewery sign up' do
    visit '/'
    click_button 'Brewery Sign Up'
    expect(current_path).to eq('/sign_up')
  end
end