require 'test_helper'

class ListPageTest < ActionDispatch::IntegrationTest
  def setup
    @list = create(:list)
    @user = create(:user)
  end

  test 'list page and deletion' do
    log_in_as(@user)
    get lists_path
    assert_template 'lists/index'
    get list_path(@list)
    assert_template 'lists/show'
    assert_difference 'List.count', -1 do
      delete list_path(@list)
    end
    assert_redirected_to lists_path
  end

  test 'elements should be hidden if not logged-in' do
    get list_path(@list)
    assert_select 'a', text: 'Edit list' , count: 0
    assert_select 'a', text: 'Delete list' , count: 0
  end

  test 'page title should be list name' do
    get list_path(@list)
    assert_select 'title', "#{@list.name} | Pantrippu"
  end
end