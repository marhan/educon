module LoggingHelper

  def user_login_name
    "#{current_user.email}"
  end

end



