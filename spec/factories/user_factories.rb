require 'factory_girl'

FactoryGirl.define do
  factory :user, :class => User do
    firstname 'firstname'
    lastname 'lastname'
    email 'user@galleries.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :admin_user, :class => AdminUser do
    email 'admin@galleries.test'
    password 'password'
  end
end
