require 'factory_girl'

FactoryGirl.define do
  factory :user, :class => User do
    email 'user@educon.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :admin_user, :class => AdminUser do
    email 'admin@educon.com'
    password 'password'
  end

  factory :devise_resource, :class => User do
    email 'user@educon.com'
    password 'password'
    password_confirmation 'password'
    reset_password_token '123token'
  end

  factory :employee, :class => User do
    employee true
    email 'employee@educon.com'
    password 'password'
    password_confirmation 'password'
    first_name 'Frank'
    last_name 'Testa'
    street 'Finksweg'
    house_number '1a'
    zip_code '21128'
    city 'Stade'
    phone '04021112'
    mobile_phone '01279987'
  end

end
