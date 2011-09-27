require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  # Bundler.require *Rails.groups(:assets => %w(development test))
  # If you want your assets lazily compiled in production, use this line
  Bundler.require(:default, :assets, Rails.env)
end

module Educon
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding          = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password, :password_confirmation]

    # Enable the asset pipeline
    config.assets.enabled    = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version    = '1.0'

    config.generators.stylesheet_engine = :scss

    # load styles from compass gem
    # http://spin.atomicobject.com/2011/07/12/sass-sprockets-compass-with-rails-3-1/
    #config.sass.load_paths << "#{Gem.loaded_specs['compass'].full_gem_path}/frameworks/compass/stylesheets"
    #config.sass.load_paths << "#{Gem.loaded_specs['compass'].full_gem_path}/frameworks/blueprint/stylesheets"

    #
    config.generators do |g|
      # don't generate RSpec tests for views and helpers
      g.view_specs false
      g.helper_specs false
      # style engines
      g.template_engine :haml
      g.stylesheet_engine = :scss
    end

    # Specific Layout for devise
    config.to_prepare do
      Devise::SessionsController.layout "signed_out"
      Devise::RegistrationsController.layout proc { |controller| user_signed_in? ? "application" : "signed_out" }
      Devise::ConfirmationsController.layout "signed_out"
      Devise::UnlocksController.layout "signed_out"
      Devise::PasswordsController.layout "signed_out"
    end

  end
end
