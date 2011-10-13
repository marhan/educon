module LoggingHelper

  def user_name
    "#{current_user.firstname} #{current_user.lastname}"
  end

end



