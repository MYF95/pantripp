Rails.application.routes.draw do

  devise_for :users, controllers: {
      sessions:       'users/sessions',
      registrations:  'users/registrations',
  }

  devise_scope :user do
    get '/login', to: 'users/sessions#new'
    get '/logout', to: 'users/sessions#destroy'
  end

  root                    to: 'static_pages#home'
  get '/help',            to: 'static_pages#help'
  get '/about',           to: 'static_pages#about'
  get 'users/:id',        to: 'users#show'


  # Association indexes logic
  get '/:user_id/lists', to: 'users#lists', as: :user_list
  get '/:list_id/users', to: 'lists#users', as: :list_of_users
  get '/products/:product_id/lists', to: 'lists#products', as: :products_lists

  # User list logic
  post '/lists/:list_id/:user_id', to: 'lists#add_list', as: :add_list
  delete '/lists/:list_id/:user_id', to: 'lists#delete_list', as: :delete_list

  # Product list logic
  post '/products/:id/lists/:list_id', to: 'lists#add_product', as: :add_product
  delete '/lists/:list_id/:product_id', to: 'lists#delete_product', as: :delete_product

  resources :users
  resources :products
  resources :lists
  resources :productlists, only: [:create, :destroy]
end