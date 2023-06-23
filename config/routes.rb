Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :relationships, only: [:create]
  end

  resources :relationships, only: [:destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
