Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :rooms
  resources :projects do
    resources :tasks, only: [:new, :edit, :destroy, :update ]
  end
end
