class List < ApplicationRecord
  # TODO name should not be too long to break the css, or the css should accomodate a longer name better
  validates :name, presence: true, length: { maximum: 30 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :location, presence: true, length: { maximum: 50 }

  has_many :userlists
  has_many :users, through: :userlists, dependent: :destroy
  has_many :productlists
  has_many :products, through: :productlists, dependent: :destroy

  def amount(product)
    return Productlist.find_by(list_id: self.id, product_id: product.id).quantity
  end
end
