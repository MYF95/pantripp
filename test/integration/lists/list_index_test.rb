require 'test_helper'

class ListIndexTest < ActionDispatch::IntegrationTest
  def setup
    @list = create(:list)
    @user = create(:user)
    @lists = List.all
  end

  test 'get all list and their links' do
    get lists_path
    assert_template 'lists/index'
    @lists.each do |list|
      assert_select 'a[href=?]', list_path(list), text: "List name: #{list.name}"
    end
  end

end
