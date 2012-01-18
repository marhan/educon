require 'factory_girl'

FactoryGirl.define do
  factory :user, :class => User do
    firstname 'firstname'
    lastname 'lastname'
    email 'user@educon.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :admin_user, :class => AdminUser do
    email 'admin@educon.com'
    password 'password'
  end

end
