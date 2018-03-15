require 'test_helper'

class UserlistTest < ActiveSupport::TestCase
  def setup
    @userlist = Userlist.new(user_id: create(:user).id, list_id: create(:list).id)
  end

  test 'should be valid' do
    assert @userlist.valid?
  end

  test 'should require user_id' do
    @userlist.user_id = nil
    assert_not @userlist.valid?
  end

  test 'should require list_id' do
    @userlist.list_id = nil
    assert_not @userlist.valid?
  end
end
