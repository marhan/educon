# Heroku Fix
# Heroku does not allow compiling sass to public folder.
# http://devcenter.heroku.com/articles/using-sass
Sass::Plugin.options.merge!(
  :template_location => 'public/stylesheets/sass',
  :css_location => 'tmp/stylesheets'
)
