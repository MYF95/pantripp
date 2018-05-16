class Productlist < ApplicationRecord
  belongs_to :product
  belongs_to :list
  validates :product_id, presence: true
  validates :list_id, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 1}
  validate :product_quantity_validation

  def product_quantity_validation
    errors.add(:quantity, 'Product quantity cannot be zero') if self.changes[:quantity].blank?
  end
end
