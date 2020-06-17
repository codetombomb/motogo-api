Rails.application.routes.draw do
  resources :users
  resources :renter_posts
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  resources :posts, only: [:index, :create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  get :bike_rent_history, to: "users#bike_rent_history"
  get :my_bikes_history, to: "bikes#my_bikes_history"
  root to: "static#home"
  default_url_options :host => "localhost:3001"
end
