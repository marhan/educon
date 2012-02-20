Educon::Application.configure do

  config.cache_classes                              = true

  # Configure static asset server for tests with Cache-Control for performance
  config.serve_static_assets                        = true
  config.static_cache_control                       = "public, max-age=3600"

  # Log error messages when you accidentally call methods on nil
  config.whiny_nils                                 = false

  # Show full error reports and disable caching
  config.consider_all_requests_local                = true
  config.action_controller.perform_caching          = false

  # Raise exceptions instead of rendering exception templates
  config.action_dispatch.show_exceptions            = false

  # Disable request forgery protection in test environment
  config.action_controller.allow_forgery_protection = false

  # Tell Action Mailer not to deliver emails to the real world.
  config.action_mailer.delivery_method              = :test

  # Print deprecation notices to the stderr
  config.active_support.deprecation                 = :stderr

  # Allow pass debug_assets=true as a query parameter to load pages with unpackaged assets
  config.assets.allow_debugging                     = true

  # Raise exception on mass assignment protection for Active Record models
  #config.active_record.mass_assignment_sanitizer    = :strict
  config.action_mailer.default_url_options = { :host => 'localhost:8989' }

  config.action_mailer.delivery_method = :test

  config.log_level = :debug
end
