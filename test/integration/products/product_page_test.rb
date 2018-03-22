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
    assert_difference 'Product.count', -1 do
      delete product_path(@product)
    end
    assert_redirected_to products_path
    assert_not flash.empty?
  end

  test 'delete and edit should not appear if not logged in' do
    get product_path(@product)
    assert_select 'a', text: 'Edit product' , count: 0
    assert_select 'a', text: 'Delete product' , count: 0
    log_in_as(@user)
    get product_path(@product)
    assert_select 'a', text: 'Edit product', count: 1
    assert_select 'a', text: 'Delete product', count: 1
  end

  test 'page title should be product name' do
    get product_path(@product)
    assert_select 'title', "#{@product.name} | Pantrippu"
  end
end
