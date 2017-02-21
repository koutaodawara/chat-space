Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups do
    resources :chats, only: %i(index create)
  end
  resources :users, only: %i(index show) do
    member do
      get :followed, :followers
    end
  end

  resources :relationships, only: %i(create delete)
end
