Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup'    , to: 'users#new'
  get    'login'     , to: 'sessions#new'
  post   'login'     , to: 'sessions#create'
  delete 'logout'    , to: 'sessions#destroy'
  get    'users/:id/following' , to: 'users#followings', as: 'following_user'
  get    'users/:id/follower'  , to: 'users#followers' , as: 'follower_user'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
end