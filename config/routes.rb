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

  # TODO Change the routings using member and collection routes. If it doesn't somehow fit, there is probably some problem with it.

  # Association indexes logic
  get '/:id/lists', to: 'users#lists', as: :user_list
  get '/:id/users', to: 'lists#users', as: :list_of_users
  get '/products/:id/lists', to: 'lists#products', as: :products_lists

  # User list logic
  post '/lists/:id/:user_id', to: 'lists#add_list', as: :add_list
  delete '/lists/:id/:user_id', to: 'lists#delete_list', as: :delete_list

  # Product list logic
  post '/products/:id/lists/:list_id', to: 'lists#add_product', as: :add_product
  get '/lists/:id/remove', to: 'lists#remove_product', as: :remove_product
  delete '/lists/:id/remove/:product_id', to: 'lists#delete_product', as: :delete_product

  resources :users
  resources :products
  resources :lists
  resources :productlists, only: [:create, :destroy]
end