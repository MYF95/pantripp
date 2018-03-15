class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def lists
    @user = User.find(params[:id])
  end
end
