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
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method              = :test

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Print deprecation notices to the stderr
  config.active_support.deprecation                 = :stderr

  # Allow pass debug_assets=true as a query parameter to load pages with unpackaged assets
  config.assets.allow_debugging                     = true

  config.log_level = :warn

  config.action_mailer.default_url_options = {:host => 'localhost:3000'}

  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
      :address              => "smtp.domain.com",
      :port                 => 587,
      :domain               => 'educon.com',
      :user_name            => 'email_user_name',
      :password             => 'email_user_password',
      :authentication       => 'plain',
      :enable_starttls_auto => true}

end
