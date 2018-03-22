require 'test_helper'

class ListCreationTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user)
  end

  test 'create new list with valid information' do
    log_in_as(@user)
    get new_list_path
    assert_difference 'List.count', 1 do
      post lists_path, params: { list: { name: 'Ponsan', capacity: 90, location: 'KFC' }}
    end
    follow_redirect!
    assert_template 'lists/show'
    assert_not flash.empty?
  end

  test 'create new list with invalid information' do
    log_in_as(@user)
    get new_list_path
    assert_no_difference 'List.count' do
      post lists_path, params: { list: { name: '', capacity: 90, location: 'Ohaio' }}
    end
    assert_template'lists/new'
    assert_select 'div.alert', 'The form contains 1 error.'
  end
end
