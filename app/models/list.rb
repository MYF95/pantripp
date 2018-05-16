class List < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :location, presence: true, length: { maximum: 50 }

  has_many :userlists
  has_many :users, through: :userlists, dependent: :destroy
  has_many :productlists
  has_many :products, through: :productlists, dependent: :destroy

  def amount(product)
    productlists.find_by(product: product).quantity
  end
end
