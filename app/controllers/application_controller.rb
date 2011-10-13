class ApplicationController < ActionController::Base
  protect_from_forgery
  include LoggingHelper
  include FlashMessageHelper
  include ErrorMessageHelper
end
