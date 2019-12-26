Rails.application.routes.draw do
  resources :apartments do
    resources :photos, only: [:destroy]

    collection do
      get 'district/:district', to: 'apartments#index_district'
    end
  end
  
  devise_for :users
  root to: 'pages#home'

  get 'pages/contacts', to: 'pages#contacts'
  get 'pages/about', to: 'pages#about'
  get 'pages/terms_and_conditions', to: 'pages#terms_and_conditions'

  resources :users, only: [:show] do
  	member do
  		get 'edit_profile'
  		patch 'update_profile'
  		get 'edit_avatar'
  		patch 'update_avatar'
  	end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
