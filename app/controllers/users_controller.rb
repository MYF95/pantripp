class UsersController < ApplicationController
  before_action :logged_in_user, only: [:lists]

  def show
    @user = User.find(params[:id])
  end

  def lists
    @user = User.find(params[:user_id])
    if current_user?(@user)
      @users = @user.lists.paginate(page: params[:page], per_page: 9)
    else
      @user = current_user
      @users = @user.lists.paginate(page: params[:page], per_page: 9)
      redirect_to user_list_path(@user)
    end
  end

  private

    def current_user? (user)
      return current_user == user
    end
end
