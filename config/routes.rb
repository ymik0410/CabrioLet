Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cars do
    collection do
      get :my_cars
    end
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:create]
  end
  resources :rewiews, only: [:destroy]

  get '/my_bookings', to: 'bookings#my_bookings'
  get '/my_cars', to: 'cars#my_cars'
  end
