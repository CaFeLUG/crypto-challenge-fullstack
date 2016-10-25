Rails.application.routes.draw do
  get 'main/index'
  root 'main#index'
  devise_for :users

  resources :contests, only: [:index, :show] do
    resources :challenges, only: [:index, :show]
  end
  resources :users, only: [:index, :show] do
    resources :contests, only: :index
  end
end
