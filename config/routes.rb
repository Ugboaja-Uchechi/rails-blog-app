Rails.application.routes.draw do

  root "user#index"

  resources :user, only: [:index, :show] do
    resources :post, only: [:index, :show]

    # get '/user/:id(.:format)', to: 'user#show', as: 'user'
    # get '/user(.:format)', to: 'user#index', as: 'user_index'
    # get '/user/:user_id/post(.:format)', to: 'post#index', as: 'user_post_index'
    # get '/user/:user_id/post/:id(.:format)', to: 'post#show', as: 'user_post'
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
