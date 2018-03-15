require 'test_helper'

class UserlistsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @userlist = Userlist.new(user_id: create(:user).id, list_id: create(:list).id)
  end

  # test 'should redirect add to list when not logged in' do
  # end
  #
  # test 'should redirect remove from list when not logged in' do
  # end

end
