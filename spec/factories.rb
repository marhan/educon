require 'factory_girl'

Factory.define :user do |u|
  u.firstname 'firstname'
  u.lastname 'lastname'
  u.email 'user@galleries.test'
  u.password 'password'
end

Factory.define :admin_user do |u|
  u.email 'admin@galleries.test'
  u.password 'password'
end

