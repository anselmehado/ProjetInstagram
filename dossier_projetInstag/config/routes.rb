Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'posts/index'
  get 'sessions/new'
  resources :posts
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources  :users

  resources :posts do
    collection do
    post :confirm
  end
  end

  resources :favorites, only: [:create, :destroy]
end
