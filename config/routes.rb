Rails.application.routes.draw do
  get "products" => 'products#index', :as => "products"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "products#index"

  resources :users
  resources :sessions
end
