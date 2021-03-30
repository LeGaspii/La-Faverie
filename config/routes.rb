Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :blogs
  resources :famillies, only: [:new, :create, :edit, :destroy, :update ]
  resources :rooms do
    resources :reservations, only: [:new, :create, :edit, :destroy, :update, :index ]
    resources :perks, only: [:new, :create, :edit, :destroy, :update, :index ]
  end
  resources :tasks, only: [:show, :update]
  resources :projects do
    resources :tasks, only: [:new, :create, :edit, :destroy, :update]
    resources :buyings, only: [:new, :create, :edit, :destroy, :update ]
    resources :usersprojects, only: [:new, :create, :edit, :destroy, :update ]
    resources :comments, only: [:new, :create, :edit, :destroy, :update ]
  end
  namespace :my do
    resources :famillies, only: [ :index ]
  end
end
