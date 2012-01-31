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

  factory :devise_resource, :class => User do
    firstname 'firstname'
    lastname 'lastname'
    email 'user@educon.com'
    password 'password'
    password_confirmation 'password'
    reset_password_token '123token'
  end

  factory :client, :class => Client do
    firstname 'Frank'
    lastname 'Testa'
    street 'Teststreet'
    house_number '45a'
    zip_code '21120'
    city 'Buxtehude'
    fon '04231344'
    mobil '017111111'
    email 'test@testa.com'
    nationality 'italienisch'
    spoken_language 'englisch'
  end

end
