Rails.application.routes.draw do
  get 'marketplace/index'
  get '/marketplace/sell/:id', to: 'marketplace#sell', as: 'marketplace_sell'
  get '/marketplace/buy/:id', to: 'marketplace#buy', as: 'marketplace_buy'
  get '/marketplace/reclaim/:id', to: 'marketplace#reclaim', as: 'marketplace_reclaim'


  get 'accounts/:id', to: 'accounts#show', as: 'account'
  get 'tickets/index'
  get 'tickets/show'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :categories
  resources :events do 
    resources :account_transactions
  end
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/events', to: 'users#user_events', as: 'user_events'
  devise_scope :user do
    authenticated :user do
     root 'users#show', as: :authenticated_root
    end
    unauthenticated do
     root 'devise/sessions#new', as: :unauthenticated_root
   end
  end
end