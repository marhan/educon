class ApplicationController < ActionController::Base
  protect_from_forgery
  #load_and_authorize_resource
  include LoggingHelper
  include FlashMessageHelper
  include ErrorMessageHelper

  layout :layout_by_signed_in

  def layout_by_signed_in
    if user_signed_in?
      "application"
    else
      "signed_out"
    end
  end
end
