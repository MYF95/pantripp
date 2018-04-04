require 'test_helper'

class UserlistsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @list = create(:list)
    @user = create(:user)
    @user2 = create(:user)
  end

  test 'should redirect add to list when not logged in' do
    get list_path(@list)
    assert_template 'lists/show'
    post add_userlist_path(@user, @list), params: { userlist: {user: @user, list: @list }}
    follow_redirect!
    assert_template 'users/sessions/new'
    assert_not flash.empty?
  end

  test 'should redirect remove from list when not logged in' do
    @userlist = Userlist.create(user: @user, list: @list)
    get list_path(@list)
    assert_template 'lists/show'
    assert_no_difference 'Userlist.count' do
      delete delete_userlist_path(@list, @user)
    end
    follow_redirect!
    assert_template 'users/sessions/new'
    assert_not flash.empty?
  end

  test 'should redirect to login when entering another users list not logged in' do
    get user_list_path(@user)
    follow_redirect!
    assert_template 'users/sessions/new'
    assert_not flash.empty?
  end

  test 'should redirect to your list when entering another users list' do
    log_in_as(@user)
    get user_list_path(@user2)
    assert_redirected_to user_list_path(@user)
  end

end
