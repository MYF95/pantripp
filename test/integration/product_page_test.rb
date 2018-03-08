require 'test_helper'

class ProductPageTest < ActionDispatch::IntegrationTest
  def setup
    @product = create(:product)
    @user = create(:user)
  end

  test 'product page and deletion' do
    log_in_as(@user)
    get products_path
    assert_template 'products/index'
    get product_path(@product)
    assert_template 'products/show'
    # This test could be improved
    assert_difference 'Product.count', -1 do
      delete product_path(@product)
    end
  end

  test 'delete and edit should not appear if not logged in' do
    get product_path(@product)
    assert_select 'a', text: 'Edit product' , count: 0
    assert_select 'a', text: 'Delete product' , count: 0
  end

end
