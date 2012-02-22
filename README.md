# Educon [![Build Status](http://travis-ci.org/marhan/educon.png)](http://travis-ci.org/marhan/educon)

This project is very new and far away from first release candidate!

## Used Projects

[Devise](https://github.com/plataformatec/devise) - for sign in

[ActiveAdmin](https://github.com/gregbell/active_admin) - for administration

[Twitter Bootstrap](https://github.com/twitter/bootstrap) - for styles

[Email-Specs](https://github.com/bmabey/email-spec) - for email tests


## Demo Application

[Educon at heroku](http://educon.heroku.com)

    User:     user@educon.com
    Password: password

## Preconditions

Bundle with option "--without production" 

    $> bundle install --without production

or install PostgreSQL driver with

    $> env ARCHFLAGS="-arch x86_64" gem install pg -- with-pg-config=/PATH/TO/POSTRESQL_SOURCE

You will find further information to Heroku and PostgreSQL [here](http://blog.dievolution.net/tipps/tutorial-rails-3-1-heroku/)

## Run Application in development environment

    $> bundle exec rake db:migrate
    $> bundle exec rake rd:seed
    $> rails s

## Run rspec tests

    $> bundle exec rake

...or with guard...

    $> guard


