require 'test_helper'

class ProductlistTest < ActiveSupport::TestCase
  def setup
    @productlist = Productlist.new(product_id: create(:product).id, list_id: create(:list).id)
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
end
