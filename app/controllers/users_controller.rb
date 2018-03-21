class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def lists
    @user = User.find(params[:user_id])
    @users = @user.lists.paginate(page: params[:page], per_page: 9)
  end
end
