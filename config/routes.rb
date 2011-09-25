Educon::Application.routes.draw do

  devise_for :users

  match '/home', :to => 'pages#home'         

  root :to => 'pages#home'

end
