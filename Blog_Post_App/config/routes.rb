Rails.application.routes.draw do

  resources :posts 

  resources :users, only: [:new, :create]

  resource :sessions, only: [:new, :create, :destroy]


end