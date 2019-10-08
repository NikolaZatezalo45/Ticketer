Rails.application.routes.draw do
  get 'tickets/index'
  get 'tickets/show'
  devise_for :users
  resources :categories
  resources :events
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