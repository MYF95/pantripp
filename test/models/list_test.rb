require 'test_helper'

class ListTest < ActiveSupport::TestCase
  def setup
    @list = create(:list)
    @product = create(:product)
  end

  test 'list should be valid' do
    assert @list.valid?
  end

  test 'name should be present' do
    @list.name = ''
    assert_not @list.valid?
  end

  test 'capacity should be present' do
    @list.capacity = nil
    assert_not @list.valid?
  end

  test 'location should be present' do
    @list.location = ''
    assert_not @list.valid?
  end

  test 'name should not be too long' do
    @list.name = 'a'*31
    assert_not @list.valid?
  end

  test 'location should not be too long' do
    @list.location = 'a'*51
    assert_not @list.valid?
  end

  test 'capacity should not be negative' do
    @list.capacity = -1
    assert_not @list.valid?
  end


end
