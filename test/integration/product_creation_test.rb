require 'test_helper'

class ProductCreationTest < ActionDispatch::IntegrationTest

  test 'create a new product with valid information' do
    get new_product_path
    assert_difference 'Product.count', 1 do
      post products_path, params: { product: { name: "Ponsan", brand: "doge", ingredients: "doge", info: "not edible but almost", shelf: "50" }}
    end
    follow_redirect!
    assert_template 'products/show'
    assert_not flash.empty?
  end

end
