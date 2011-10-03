Educon::Application.routes.draw do

  get "pages/index"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  match '/home', :to => 'pages#home'

  match '/index', :to => 'pages#index'

  root :to => 'pages#home'

end
