Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :rooms do
    resources :perks, only: [:new, :create, :edit, :destroy, :update, :index ]
  end
  resources :projects
end
