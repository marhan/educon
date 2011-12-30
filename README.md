# Educon [![Build Status](http://travis-ci.org/marhan/educon.png)](http://travis-ci.org/marhan/educon)

This project is very new and far away from first release candidate!

## Used Projects

[Devise](https://github.com/plataformatec/devise) - for sign in

[ActiveAdmin](https://github.com/gregbell/active_admin) - for administration

[Twitter Bootstrap](https://github.com/twitter/bootstrap) - for styles

## Demo Application

[Educon at heroku](http://educon.heroku.com)

User / Password: user@educon.com / password


## Preconditions

Due to Heroku out of the box deployment problems with Rails 3.1, you need to install prostgresql sources on you're machine.
Choose the way you prefere to get the source (e.g. MacPorts).

Then you can compile the native extensions of the pg gem...

    $>env ARCHFLAGS="-arch x86_64" gem install pg -- with-pg-config=/path/to/your/postgresql/source

[Further Information](http://blog.dievolution.net/tipps/tutorial-rails-3-1-heroku/)

## Run Application in deployment mode

    $> bundle exec rake db:migrate
    $> bundle exec rake rd:seed
    $> rails s

## Run rspec & cucumber tests

    $> bundle exec rake

...or with guard...

    $> guard

## Run Metrics

shows several metrics with [metrical](http://iain.nl/easier-metricfu-with-metrical)

    $> bundle exec metrical

shows code coverage of rspec tests with [simplecov](https://github.com/colszowka/simplecov)

    $> bundle exec rspec spec
    $> open coverage/index.html

shows best practices hints with [rails-bestpractices](http://rails-bestpractices.com/)

    $> rails_best_practices -f html --with-textmate
    $> open rails_best_practices_output.html



