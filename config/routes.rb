Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cars do
    resources :bookings, only: [:create]
  end
  get '/my_bookings', to: 'bookings#my_bookings'
  get '/my_cars', to: 'cars#my_cars'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
