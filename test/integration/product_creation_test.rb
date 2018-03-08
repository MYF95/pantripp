require 'test_helper'

class ProductCreationTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user)
  end

  test 'create a new product with valid information' do
    log_in_as(@user)
    get new_product_path
    assert_difference 'Product.count', 1 do
      post products_path, params: { product: { name: "Ponsan", brand: "doge", ingredients: "doge", info: "not edible but almost", shelf: "50" }}
    end
    follow_redirect!
    assert_template 'products/show'
    assert_not flash.empty?
  end

  test 'create a new product with invalid information' do
    log_in_as(@user)
    get new_product_path
    assert_no_difference 'Product.count' do
      post products_path, params: { product: { name: "", brand: "", ingredients: "", info: "not edible but almost", shelf: "" }}
    end
    assert_template'products/new'
    assert_select 'div.alert', 'The form contains 4 errors.'
  end

end
