Educon::Application.routes.draw do

  get "users/home"
  get "pages/about"
  get "pages/impressum"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  match '/home', :to => 'users#home'
  match '/impressum', :to => 'pages#impressum'
  match '/about', :to => 'pages#about'

  root :to => 'users#home'

end
