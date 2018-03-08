require 'test_helper'

class ListEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user)
    @list = create(:list)
  end

  test 'unsuccessful edit' do
    log_in_as(@user)
    get edit_list_path(@list)
    assert_template 'lists/edit'
    patch list_path(@list), params: { list: { name: '' }}
    assert_template 'lists/edit'
    assert_select 'div.alert', 'The form contains 1 error.'
  end

  test 'successful edit' do
    log_in_as(@user)
    get edit_list_path(@list)
    assert_template 'lists/edit'
    name = 'Great chicken'
    capacity = 150
    location = 'Las Palmas'
    patch list_path(@list), params: { list: { name: name, capacity: capacity, location: location}}
    assert_not flash.empty?
    assert_redirected_to @list
    @list.reload
    assert_equal name, @list.name
    assert_equal capacity, @list.capacity
    assert_equal location, @list.location
  end
end
