source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'sqlite3'
gem 'jquery-rails'
gem 'haml'
gem 'devise'
# rake helper tasks
gem 'limerick_rake'
# administration interface
gem 'activeadmin'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'compass'
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
  # Generate haml views
  gem "haml-rails"
end

group :development, :test do
  gem "rspec-rails"
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem "fuubar"
  # BDD
  gem "factory_girl_rails"
  gem "database_cleaner"
  gem "cucumber-rails"
  gem "capybara"
  gem "launchy"
end
