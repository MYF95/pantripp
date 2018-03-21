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

  get '/:user_id/lists', to: 'users#lists', as: :user_list # ID is the ID of the user
  get '/:list_id/users', to: 'lists#users', as: :list_of_users # ID is the ID of the list
  get '/:product_id/products', to: 'lists#products', as: :products_lists # ID is the product ID to add to a list

  resources :users
  resources :products
  resources :lists
  resources :userlists, only: [:create, :destroy]
  resources :productlists, only: [:create, :destroy]
end
