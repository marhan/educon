class ApplicationController < ActionController::Base
  protect_from_forgery
  include LoggingHelper
  include FlashMessageHelper
  include ErrorMessageHelper

  layout :layout_by_signed_in

  protected

  def layout_by_signed_in
    if user_signed_in?
      "application"
    else
      "signed_out"
    end
  end
end
