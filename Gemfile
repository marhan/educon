source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem 'sqlite3'
gem 'jquery-rails'
gem 'haml'

# style
gem 'bootstrap-sass'

# avoiding version 1.3.4
# http://stackoverflow.com/questions/7624661/rake-already-initialized-constant-warning
gem 'rack', '1.3.3'

# login
gem 'devise'

# administration interface
gem 'activeadmin'

# moved out of assets, due active admin init probems
# http://www.davidlowry.co.uk/400/activeadmin-on-heroku-rails-3-1/
gem 'sass-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'compass'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'

group :production do
  # heroku needs this for Rails 3.1 ...
  # http://blog.dievolution.net/tipps/tutorial-rails-3-1-heroku/
  # env ARCHFLAGS="-arch x86_64" gem install pg -- with-pg-config=/opt/local/lib/postgresql90/bin/pg_config
  gem "pg", "~> 0.11.0"
  # Fix for javascript runtime problems on heroku
  # gem "therubyracer-heroku"
end

group :development do
  # deployment on heroku
  gem "heroku"
  # Generate haml views
  gem "haml-rails"
end

group :development, :test do
  gem "rspec-rails"
  # Pretty printed test output
  gem 'turn', :require => false
  #gem "fuubar"
  # BDD
  gem "factory_girl_rails", ">= 1.2"
  gem "database_cleaner"
  gem "cucumber-rails"
  gem "capybara"
  gem "launchy"

  # you don't need guard to test on travis
  unless ENV['TRAVIS']
    gem 'pry'
    gem 'rb-fsevent', :require => false
    gem 'spork', '~> 0.9.0.rc'
    gem 'guard-spork'
    gem 'guard-rspec'
    gem 'guard-cucumber'
    gem "growl_notify"
  end
end

