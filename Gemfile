source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :production do
  # heroku needs this for Rails 3.1 ...
  # http://blog.dievolution.net/tipps/tutorial-rails-3-1-heroku/
  # env ARCHFLAGS="-arch x86_64" gem install pg -- with-pg-config=/opt/local/lib/postgresql90/bin/pg_config
  gem "pg", "~> 0.11.0"
  # Fix for javascript runtime problems on heroku
  gem "therubyracer-heroku"
end

group :development do
  # guard file changes
  gem 'rb-fsevent', :require => false
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'guard-livereload'
  # deployment on heroku
  gem "heroku"
end

group :development, :test do
  gem "fuubar"
  gem "rspec-rails"
  gem "capybara"
  gem "cucumber-rails"
  gem "launchy"
  gem "factory_girl_rails"
  gem "database_cleaner"
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
