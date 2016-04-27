Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup'  , to: 'users#new'
  get    'login'   , to: 'sessions#new'
  post   'login'   , to: 'sessions#create'
  delete 'logout'  , to: 'sessions#destroy'
  get    'settings', to: 'settings#edit'
  patch  'settings', to: 'settings#update'
  put    'settings', to: 'settings#update'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end