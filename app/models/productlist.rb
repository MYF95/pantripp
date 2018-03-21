class Productlist < ApplicationRecord
  belongs_to :product
  belongs_to :list
  validates :product_id, presence: true
  validates :list_id, presence: true
end
