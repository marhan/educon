Educon::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes                     = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets               = false

  # Compress JavaScripts and CSS
  config.assets.compress                   = true

  config.assets.compile             = true

  # active admin assets
  #config.assets.precompile += %w[active_admin.css active_admin.js]

  # Generate digests for assets URLs
  config.assets.digest              = true

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks             = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  config.action_mailer.default_url_options = {:host => 'educon.heroku.com'}

  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
      :address              => "smtp.1und1.de",
      :port                 => 587,
      :domain               => 'educon.heroku.com',
      :user_name            => ENV['email_user_name'],
      :password             => ENV['email_user_password'],
      :authentication       => 'plain',
      :enable_starttls_auto => true}

  config.log_level = :info

end
