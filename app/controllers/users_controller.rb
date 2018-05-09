class UsersController < ApplicationController
  before_action :logged_in_user, only: [:lists]
  before_action :user_getter, only: [:show, :lists]
  before_action :userlist_getter, only: [:show, :lists]

  def show; end

  def lists
    if current_user?(@user)
    else
      # Redirects user to their lists if they try to get into another users' list
      @user = current_user
      @users = @user.lists.paginate(page: params[:page], per_page: 18)
      redirect_to user_list_path(@user)
    end
  end

  private

    def user_getter
      @user = User.find(params[:id])
    end

    def userlist_getter
      @users = @user.lists.paginate(page: params[:page], per_page: 18)
    end

    def current_user? (user)
      return current_user == user
    end
end
