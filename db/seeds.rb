puts 'Create the default user'
user = User.create! :name => 'Default User', :email => 'user@educon.com', :password => 'password', :password_confirmation => 'password'
puts 'New user created with email: ' << user.email

puts 'Create the default admin'
admin_user = AdminUser.create! :email => 'admin@educon.com', :password => 'password', :password_confirmation => 'password'
puts 'New admin created with email: ' << admin_user.email