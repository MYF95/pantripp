Rails.application.routes.draw do

  devise_for :users, controllers: {
      sessions:       'users/sessions',
      registrations:  'users/registrations',
  }

  devise_scope :user do
    get '/login', to: 'users/sessions#new'
    get '/logout', to: 'users/sessions#destroy'
  end

  root to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get 'users/:id', to: 'users#show'

  resources :users
end
