require 'test_helper'

class ListTest < ActiveSupport::TestCase
  def setup
    @list = create(:list)
  end

  test 'list should be valid' do
    assert @list.valid?
  end

  test 'name should be present' do
    @list.name = ''
    assert_not @list.valid?
  end

  test 'name should not be too long' do
    @list.name = 'a'*31
    assert_not @list.valid?
  end
end
