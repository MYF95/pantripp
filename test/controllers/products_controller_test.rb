require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @product = create(:product)
  end

  test 'should get new' do
    get new_product_path
    assert_response :success
  end

  test 'should get index' do
    get products_path
    assert_response :success
  end

  # should this functionalities actually block guests from even entering into this actions?

  test 'create as non-logged in user should redirect to login' do
    get new_product_path
    post products_path, params: { product: { name: 'Ponsan', brand: 'doge', ingredients: 'doge', info: 'not edible but almost', shelf: '50' }}
    follow_redirect!
    assert_template 'users/sessions/new'
    assert_not flash.empty?
  end

  test 'edit as non-logged in user should redirect to login' do
    get product_path(@product)
    assert_template 'products/show'
    get edit_product_path(@product)
    assert_redirected_to login_url
  end

  test 'delete as non-logged in user should redirect to login' do
    get product_path(@product)
    assert_no_difference 'Product.count' do
      delete product_path(@product)
    end
    follow_redirect!
    assert_template 'users/sessions/new'
  end

end
