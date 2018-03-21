module UsersHelper

  # defines if the logged-in user is the user to check
  def current_user? (user)
    return current_user == user
  end
end
