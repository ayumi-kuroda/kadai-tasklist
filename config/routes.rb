Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  
  resources :tasks
  #ユーザ登録用のルーティング
  get 'signup', to: 'users#new'
  resources :users, only: [:create]
end
