source :rubygems

gem "rails", "3.2.0"
gem "sqlite3"
gem "jquery-rails"
gem "haml"
gem "rack"
gem "devise"
gem "activeadmin"
gem "meta_search"
gem "jquery-rails"
gem "cancan"

# moved out of assets, due active admin init problems
# http://www.davidlowry.co.uk/400/activeadmin-on-heroku-rails-3-1/
gem "sass-rails", "~> 3.2.3"
gem "anjlab-bootstrap-rails", ">= 2.0", :require => "bootstrap-rails"

# Gems used only for assets and not required in production environments by default.
gem "coffee-rails", "~> 3.2.1", :group => :assets
gem "uglifier", "~> 1.0.3",:group => :assets

gem "pg", "~> 0.11.0", :group => :production
#gem "therubyracer", :group => :production
gem "thin",:group => :production

gem "heroku", :group => :development
gem "haml-rails", :group => :development
gem "launchy", :group => :development

gem "turn", :require => false, :group => :test
gem "factory_girl_rails", ">= 1.2", :group => :test
gem "database_cleaner", :group => :test
gem "capybara", :group => :test
gem "capybara-webkit", :group => :test
gem "email_spec", :group => :test

gem "rspec-rails", :group => [:development, :test]
gem "seed-fu", :group => [:development, :test]

# not running on travis-ci
unless ENV['TRAVIS']
  gem "rb-fsevent", :require => false, :group => :test
  gem "guard-rspec", :group => :test
  gem "guard-bundler", :group => :test
  gem "guard-migrate", :group => :test
  gem "growl_notify", :group => :test
end

