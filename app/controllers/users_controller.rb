class UsersController < ApplicationController
  before_filter :authenticate_user!

  def home
    logger.info "User '#{user_name}' visits his home site"

  end
end
