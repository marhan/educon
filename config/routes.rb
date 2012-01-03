Educon::Application.routes.draw do

  get "users/home"
  get "pages/welcome"

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, :only => [:sessions, :registrations, :passwords]

  match '/home', :to => 'pages#home'
  match '/welcome', :to => 'pages#welcome'

  root :to => 'pages#welcome'

end
