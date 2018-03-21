class List < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  has_many :userlists
  has_many :users, through: :userlists
  has_many :productlists
  has_many :products, through: :productlists

  def amount(product)
    return Productlist.find_by(list_id: self.id, product_id: product.id).quantity
  end
end