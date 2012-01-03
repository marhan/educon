class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => :welcome

  def welcome
  end

  def home
    logger.info "User '#{user_name}' visits his home site"
  end

end
