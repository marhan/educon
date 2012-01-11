require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require *Rails.groups(:assets => %w(development test))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Educon
  class Application < Rails::Application
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Berlin'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[File.join(Rails.root, 'config', 'locales', '**', '*.{rb,yml}')]

    config.i18n.default_locale = :de
    # german only
    config.i18n.locale = config.i18n.default_locale = :de

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
      #g.test_framework :rspec, :fixture => true
      #g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      # don't generate RSpec tests for views and helpers
      g.view_specs false
      g.helper_specs false
      # style engines
      g.template_engine :haml
      g.stylesheet_engine = :scss
    end

  end
end
