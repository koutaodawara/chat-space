Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups do
    resources :chats, only: [:index, :create]
  end
  resources :users, only: [:index, :show] do
    member do
      get :followed, :followers
    end
  end

  resources :relationships, only: [:create, :delete]
end
