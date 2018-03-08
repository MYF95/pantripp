require 'test_helper'

class ProductIndexTest < ActionDispatch::IntegrationTest

  def setup
    @product = create(:product)
    @user = create(:user)
    @products = Product.all
  end

  test 'get all products and their links' do
    get products_path
    assert_template 'products/index'
    @products.each do |product|
      assert_select 'a[href=?]', product_path(product), text: "Product name: #{product.name}"
    end
  end

  test 'index as logged in user' do
    log_in_as(@user)
    get products_path
    assert_select 'a', text: '+ Add to my list', count: @products.count
  end

end
