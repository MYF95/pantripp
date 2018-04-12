class UsersController < ApplicationController
  before_action :logged_in_user, only: [:lists]
  before_action :user_getter, only: [:show, :lists]

  def show; end

  def lists
    if current_user?(@user)
      @users = @user.lists.paginate(page: params[:page], per_page: 9)
    else
      @user = current_user
      @users = @user.lists.paginate(page: params[:page], per_page: 9)
      redirect_to user_list_path(@user)
    end
  end

  private

    def user_getter
      @user = User.find(params[:id])
    end

    def current_user? (user)
      return current_user == user
    end
end
