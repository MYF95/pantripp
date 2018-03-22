class Product < ApplicationRecord
  has_many :productlists
  has_many :lists, through: :productlists
  validates :name, presence: true, length: { maximum: 50}
  validates :brand, presence: true, length: { maximum: 50}
  validates :ingredients, presence: true
  validates :info, presence: true
  validates :shelf, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
end
