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

  get '/:id/lists', to: 'users#lists', as: :users_lists
  get '/:id/users', to: 'lists#users', as: :lists_users

  resources :users
  resources :products
  resources :lists
  resources :userlists, only: [:create, :destroy]
  resources :productlists, only: [:create, :destroy]
end
