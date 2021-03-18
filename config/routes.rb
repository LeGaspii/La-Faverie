Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :rooms do
    resources :perks, only: [:new, :create, :edit, :destroy, :update, :index ]
  end
  resources :tasks, only: [:show, :update]
  resources :projects do
    resources :tasks, only: [:new, :create, :edit, :destroy, :update]
    resources :buyings, only: [:new, :create, :edit, :destroy, :update ]
    resources :usersprojects, only: [:new, :create, :edit, :destroy, :update ]
  end
end
