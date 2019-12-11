Rails.application.routes.draw do
  resources :apartments
  devise_for :users
  root to: 'pages#home'

  get 'pages/contacts', to: 'pages#contacts'
  get 'pages/about', to: 'pages#about'
  get 'pages/terms_and_conditions', to: 'pages#terms_and_conditions'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
