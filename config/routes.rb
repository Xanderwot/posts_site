PostsSite::Application.routes.draw do
  devise_for :users

  resources :articles

  root :to => 'Home#index'

end
