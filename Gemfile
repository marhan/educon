source 'http://rubygems.org'

gem 'rails', '3.1'
gem 'sqlite3'
gem 'jquery-rails'
gem 'haml'
# styles
gem 'bootstrap-sass'
# avoiding version 1.3.4
# http://stackoverflow.com/questions/7624661/rake-already-initialized-constant-warning
gem 'rack', '1.3.3'
# authentication
gem 'devise'
# administration interface
gem 'activeadmin'
# moved out of assets, due active admin init probems
# http://www.davidlowry.co.uk/400/activeadmin-on-heroku-rails-3-1/
gem 'sass-rails'
gem 'meta_search', '>= 1.1.0.pre'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  #gem 'compass'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'

group :production do
  # heroku needs this for Rails 3.1 ...
  # http://blog.dievolution.net/tipps/tutorial-rails-3-1-heroku/
  # env ARCHFLAGS="-arch x86_64" gem install pg -- with-pg-config=/opt/local/lib/postgresql90/bin/pg_config
  #gem "pg", "~> 0.11.0"
  gem 'therubyracer'
end

group :development do
  # deployment on heroku
  gem "heroku"
  # Generate haml views
  gem "haml-rails"
  # better rails console
  gem 'pry'
end

group :development, :test do
  gem "rspec-rails"
  # Pretty printed test output
  gem 'turn', :require => false
  # BDD
  gem "factory_girl_rails", ">= 1.2"
  gem "database_cleaner"
  gem "capybara"
  gem "launchy"

  # you don't need guard to test on travis
  unless ENV['TRAVIS']
    gem 'rb-fsevent', :require => false
    gem 'guard-rspec'
    gem 'guard-bundler'
    gem 'guard-migrate'
    gem "growl_notify"
    # metrics
    gem 'metrical'
    gem "simplecov", :require => false
    gem "rails_best_practices"
  end
end

