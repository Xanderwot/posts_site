PostsSite::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users

  resources :articles

  match "/featured" => "articles#featured_article"
  match "/unfeatured" => "articles#unfeatured_article"

  root :to => 'Home#index'

end
