Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html\
  devise_for :users
  root to: 'events#index'
  resources :events
  resources :users, only: [:show]
  resources :event_attendings, only: [:create, :destroy]
end
