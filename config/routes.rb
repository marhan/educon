Educon::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  match '/home', :to => 'pages#home'         

  root :to => 'pages#home'

end
