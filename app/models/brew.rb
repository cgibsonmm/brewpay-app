class Brew < ApplicationRecord
  has_one_attached :logo
  belongs_to :brewery
end
