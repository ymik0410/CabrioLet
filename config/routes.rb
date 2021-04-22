Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cars do
    collection do
      get :my_cars
    end
    resources :reviews, only: [:new, :create]
  end
  resources :rewiews, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
