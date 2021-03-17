Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :rooms do
    resources :perks, only: [:new, :create, :edit, :destroy, :update, :index ]
  end
  resources :projects do
    resources :tasks, only: [:new, :create, :edit, :destroy, :update, :index ]
    resources :buyings, only: [:new, :create, :edit, :destroy, :update, :index ]

  end
end
