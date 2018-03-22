require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = create(:product)
  end

  test 'should be valid' do
    assert @product.valid?
  end

  test 'name should be present' do
    @product.name = ''
    assert_not @product.valid?
  end

  test 'brand should be present' do
    @product.brand = ''
    assert_not @product.valid?
  end

  test 'ingredients should be present' do
    @product.ingredients = ''
    assert_not @product.valid?
  end

  test 'info should be present' do
    @product.info = ''
    assert_not @product.valid?
  end

  test 'shelf life should be present' do
    @product.shelf = ''
    assert_not @product.valid?
  end

  test 'shelf life should not be negative' do
    @product.shelf = -1
    assert_not @product.valid?
  end

  test 'name should not be too long' do
    @product.name = 'a'*51
    assert_not @product.valid?
  end

  test 'brand should not be too long' do
    @product.brand = 'a'*51
    assert_not @product.valid?
  end

end
