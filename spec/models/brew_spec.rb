require 'rails_helper'

RSpec.describe Brew, type: :model do
  it 'has a valid factory' do
    expect(build(:brew)).to be_valid
  end

  it 'is invalid without a title' do
    expect(build(:brew, title: '')).not_to be_valid
  end

  it 'is invalid if title is less than 3 chars' do
    expect(build(:brew, title: 'a')).not_to be_valid
    expect(build(:brew, title: 'aa')).not_to be_valid
    expect(build(:brew, title: 'aaa')).to be_valid
  end

  it 'is invalid without a description' do
    expect(build(:brew, description: '')).not_to be_valid
  end

  it 'is invalid without a description less than 10 chars' do
    expect(build(:brew, description: 'asdfgewds')).not_to be_valid
    expect(build(:brew, description: 'asdfgewdss')).to be_valid
  end
  it 'is invalid without a price' do
    expect(build(:brew, price: '')).not_to be_valid
  end

  it 'is invalid without a positive decimal' do
    expect(build(:brew, price: -1.00)).not_to be_valid
    expect(build(:brew, price: 0)).not_to be_valid
    expect(build(:brew, price: 3.99)).to be_valid
  end

  it 'is invalid without a ABV' do
    expect(build(:brew, ABV: nil)).not_to be_valid
    expect(build(:brew, ABV: -1.00)).not_to be_valid
    expect(build(:brew, ABV: 0)).to be_valid
    expect(build(:brew, ABV: 1.00)).to be_valid
  end

  it 'should return a name' do
    @brew = build(:brew)
    puts @brew.stock
  end
end
