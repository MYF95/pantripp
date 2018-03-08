require 'test_helper'

class ProductPageTest < ActionDispatch::IntegrationTest
  def setup
    @product = create(:product)
  end

  test 'product page and deletion' do
    get products_path
    assert_template 'products/index'
    get product_path(@product)
    assert_template 'products/show'
    # This test could be improved
    assert_difference 'Product.count', -1 do
      delete product_path(@product)
    end
  end

end
