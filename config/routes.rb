Rails.application.routes.draw do
  
  root to: 'pages#home'

  get 'pages/contacts', to: 'pages#contacts'
  get 'pages/about', to: 'pages#about'
  get 'pages/terms_and_conditions', to: 'pages#terms_and_conditions'

  devise_for :users
  resources :users, only: [:show] do
  	member do
  		get 'edit_profile'
  		patch 'update_profile'
  		get 'edit_avatar'
  		patch 'update_avatar'
  	end
  end

  resources :apartments do
    resources :photos, only: [:destroy]
    resources :bookings, only: [:new] #add bookings new under apartments

    collection do
      get 'district/:district', to: 'apartments#index_district'
    end
  end
  
  resources :bookings, except: [:new] do #remove new from bookings
    resources :payments, only: [:new, :create]
  end

end
