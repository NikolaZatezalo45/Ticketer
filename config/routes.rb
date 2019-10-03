Rails.application.routes.draw do
  get 'users/show'
  devise_for :users

  devise_scope :user do
    authenticated :user do
     root 'users#show', as: :authenticated_root
    end
    unauthenticated do
     root 'devise/sessions#new', as: :unauthenticated_root
   end
  end
end