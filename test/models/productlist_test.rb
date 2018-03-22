require 'test_helper'

class ProductlistTest < ActiveSupport::TestCase
  def setup
    @product = create(:product)
    @list = create(:list)
    @productlist = Productlist.create(product: @product, list: @list, quantity: 17)
  end

  test 'should be valid' do
    assert @productlist.valid?
  end

  test 'should require a product id' do
    @productlist.product_id = nil
    assert_not @productlist.valid?
  end

  test 'should require a list id' do
    @productlist.list_id = nil
    assert_not @productlist.valid?
  end

  test 'amount method should be calculated correctly' do
    assert_equal @productlist.quantity, @list.amount(@product)
  end
end
