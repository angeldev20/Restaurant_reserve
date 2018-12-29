Rails.application.routes.draw do

  root to: 'visitors#index'
  devise_for :users, controllers: {registrations: 'registrations'}                                
  resources :users
  
  resources :reservations
  resources :restaurants do
    resources :coupons
  end
  resources :attachments
    
  namespace :admin do
    resources :users
    resources :coupons
    resources :favorites
    resources :operationtimes
    resources :reservations
    resources :restaurants
    resources :attachments
    resources :cuisines
    root to: "users#index"
  end

end