require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @list = create(:list)
  end

  test 'should get new' do
    get new_list_path
    assert_response :success
  end

  test 'should get index' do
    get lists_path
    assert_response :success
  end

  test 'create as non-logged in user should redirect to login' do
    get new_list_path
    post lists_path, params: { list: { name: 'Ponsan', capacity: 90, location: 'KFC'}}
    follow_redirect!
    assert_template 'users/sessions/new'
    assert_not flash.empty?
  end

  test 'edit as non-logged in user should redirect to login' do
    get list_path(@list)
    assert_template 'lists/show'
    get edit_list_path(@list)
    assert_redirected_to login_url
  end

  test 'delete as non-logged in user should redirect to login' do
    get list_path(@list)
    assert_no_difference 'List.count' do
      delete list_path(@list)
    end
    follow_redirect!
    assert_template 'users/sessions/new'
  end

end
