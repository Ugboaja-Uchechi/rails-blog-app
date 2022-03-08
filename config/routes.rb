Rails.application.routes.draw do
  devise_for :users

  root "user#index"

  resources :user, only: [:index, :show] do
    resources :post, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
