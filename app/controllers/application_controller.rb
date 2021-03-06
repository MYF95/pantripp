class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

    def logged_in_user
      unless user_signed_in?
        flash[:danger] = 'Please log in'
        redirect_to login_url
      end
    end
end
