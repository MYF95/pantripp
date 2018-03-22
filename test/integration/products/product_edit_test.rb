require 'test_helper'

class ProductEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user)
    @product = create(:product)
  end

  test 'unsuccessful edit' do
    log_in_as(@user)
    get edit_product_path(@product)
    assert_template 'products/edit'
    patch product_path(@product), params: { product: { name: '', brand: ''}}
    assert_template 'products/edit'
    assert_select 'div.alert', 'The form contains 2 errors.'
  end

  test 'successful edit' do
    log_in_as(@user)
    get edit_product_path(@product)
    assert_template 'products/edit'
    name = 'Great chicken'
    brand = 'grand kfc'
    ingredients = 'chicken, holy chicken'
    info = 'The greatest chicken ever alive'
    shelf = 456987
    patch product_path(@product), params: { product: { name: name, brand: brand, ingredients: ingredients, info: info, shelf: shelf}}
    assert_not flash.empty?
    assert_redirected_to @product
    @product.reload
    assert_equal name, @product.name
    assert_equal brand, @product.brand
    assert_equal ingredients, @product.ingredients
    assert_equal info, @product.info
    assert_equal shelf, @product.shelf
  end

end
