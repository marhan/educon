class ApplicationController < ActionController::Base
  protect_from_forgery
  #load_and_authorize_resource
  include LoggingHelper
  include FlashMessageHelper
  include ErrorMessageHelper

  layout :layout_by_signed_in

  # sets the layout
  def layout_by_signed_in
    if user_signed_in?
      "application"
    else
      "signed_out"
    end
  end

  # will be invoked by devise after sign in
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(AdminUser)
      return admin_dashboard_path
    else
      return home_path
    end
  end
end
