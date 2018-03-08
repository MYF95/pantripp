class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30}
  validates :brand, presence: true, length: { maximum: 30}
  validates :ingredients, presence: true
  validates :info, presence: true
  validates :shelf, presence: true
end
