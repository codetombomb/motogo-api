Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :sessions, only: [:create]
  # resources :registrations, only: [:create]

  namespace :api do
    namespace :v1 do 


      resources :users, only: [:create, :index, :update]
            post '/login', to: 'auth#create'
            get '/profile', to: 'users#profile'
      resources :bikes
      delete :logout, to: "sessions#logout"
      get :logged_in, to: "sessions#logged_in"

      
    end
  end 
end
