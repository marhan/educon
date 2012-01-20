source :rubygems

gem 'rails', '3.1'
gem 'sqlite3'
gem 'jquery-rails'
gem 'haml'
# styles
gem 'bootstrap-sass'
# avoiding version 1.3.4
# http://stackoverflow.com/questions/7624661/rake-already-initialized-constant-warning
gem 'rack', '1.3.3'
gem 'devise'
gem 'activeadmin'
# moved out of assets, due active admin init problems
# http://www.davidlowry.co.uk/400/activeadmin-on-heroku-rails-3-1/
gem 'sass-rails'
gem 'meta_search', '>= 1.1.0.pre'

# Gems used only for assets and not required in production environments by default.
group :assets do
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'

group :production do
  gem "pg", "~> 0.11.0"
  gem 'therubyracer'
end

group :development do
  gem "heroku"
  gem "haml-rails"
  gem 'pry'
  gem "launchy"
  unless ENV['TRAVIS']
    # metrics
    gem 'metrical'
    gem "simplecov", :require => false
    gem "rails_best_practices"
  end
end

group :test do
  gem "rspec-rails"
  gem 'turn', :require => false
  gem "factory_girl_rails", ">= 1.2"
  gem "database_cleaner"
  gem "capybara"
  gem 'email_spec'

  unless ENV['TRAVIS']
    gem 'rb-fsevent', :require => false
    gem 'guard-rspec'
    gem 'guard-bundler'
    gem 'guard-migrate'
    gem "growl_notify"
  end
end
