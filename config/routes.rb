Rails.application.routes.draw do
  resources :users
  resources :renter_posts
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  resources :posts, only: [:index, :create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"
  default_url_options :host => "localhost:3001"
end
