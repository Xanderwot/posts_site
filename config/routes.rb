PostsSite::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users

  resources :articles

  root :to => 'Home#index'

end
