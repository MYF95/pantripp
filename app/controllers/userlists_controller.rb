class UserlistsController < ApplicationController
  before_action :logged_in_user
  before_action :user_setter
  before_action :list_setter, only: [:create]

  def create
    @userlist = @user.userlists.new(list: @list)
    # @userlist = Userlist.new(user: @user, list: @list)
    if @userlist.save
      flash[:info] = 'List added to your lists'
      redirect_to lists_users_path(@user)
    else
      redirect_to root_path
    end
  end

  def destroy
    @userlist = Userlist.find(params[:id])
    if @userlist.destroy
      flash[:info] = 'List removed from your lists'
      redirect_to lists_users_path(@user)
    else
      flash[:error] = 'Something went wrong'
      redirect_to root_path
    end
  end

  private

    def user_setter
      @user = User.find(params[:user_id])
    end

    def list_setter
      @list = List.find(params[:list_id])
    end

end
