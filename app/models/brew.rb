class Brew < ApplicationRecord
  has_one_attached :logo
  belongs_to :brewery

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :ABV, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def stock
    "#{title}, ABV: #{self.ABV}, Price: #{ActiveSupport::NumberHelper.number_to_currency(price)}"
  end
end
