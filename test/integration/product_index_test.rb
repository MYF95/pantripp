require 'test_helper'

class ProductIndexTest < ActionDispatch::IntegrationTest

  def setup
    @product = build(:product)
  end

  test 'get all products and their links' do
    get products_path
    assert_template 'products/index'
    users = User.all
    users.each do |product|
      assert_select 'a[href=?]', product_path(product)
    end
  end

end
