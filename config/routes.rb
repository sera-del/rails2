Rails.application.routes.draw do
  get 'reservations/index'
  post 'reservations/confirm', to: 'reservations#confirm'
  get 'users/account', to: 'users#account'
  get 'users/profile', to: 'users#profile'
  get 'rooms/index'
  get 'rooms/own', to: 'rooms#own'
  get 'home/index'
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :rooms do
    collection do
      get 'search'
   end
  end
  
  resources :users
  
  resources :reservations
  
  resources :rooms do
    resources :reservations
  end

end
