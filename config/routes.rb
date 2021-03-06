Educon::Application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, :only => [:sessions, :registrations, :passwords]

  resources :users

  match '/home', :to => 'users#home', :as => :home
  match '/welcome', :to => 'pages#welcome', :as => :welcome

  root :to => 'pages#welcome'

end
