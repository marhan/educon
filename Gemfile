source :rubygems

gem "rails", "3.1.3"
gem "sqlite3"
gem "jquery-rails"
gem "haml"
# styles
gem "bootstrap-sass"
# avoiding version 1.3.4
# http://stackoverflow.com/questions/7624661/rake-already-initialized-constant-warning
gem "rack", "~> 1.3.5"
gem "devise"
gem "activeadmin", "~> 0.4.0"
# moved out of assets, due active admin init problems
# http://www.davidlowry.co.uk/400/activeadmin-on-heroku-rails-3-1/
gem "sass-rails"
gem "meta_search", ">= 1.1.0.pre"
gem "jquery-rails"
# Gems used only for assets and not required in production environments by default.
gem "coffee-rails", :group => :assets
gem "uglifier", :group => :assets

gem "pg", "~> 0.11.0", :group => :production
gem "therubyracer", :group => :production

gem "heroku", :group => :development
gem "haml-rails", :group => :development
gem "pry", :group => :development
gem "launchy", :group => :development

gem "turn", :require => false, :group => :test
gem "factory_girl_rails", ">= 1.2", :group => :test
gem "database_cleaner", :group => :test
gem "capybara", :group => :test
gem "capybara-webkit", :group => :test
gem "email_spec", :group => :test

gem "rspec-rails", :group => [:development, :test]
gem "seed-fu", "~> 2.1.0", :group => [:development, :test]

# not running on travis-ci
unless ENV['TRAVIS']
  gem "rb-fsevent", :require => false, :group => :test
  gem "guard-rspec", :group => :test
  gem "guard-bundler", :group => :test
  gem "guard-migrate", :group => :test
  gem "growl_notify", :group => :test
end

