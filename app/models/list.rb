class List < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  has_many :userlists
  has_many :users, through: :userlists
  has_many :productlists
  has_many :products, through: :productlists
end
