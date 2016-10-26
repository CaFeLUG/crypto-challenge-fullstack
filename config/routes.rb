Rails.application.routes.draw do
  get 'leaderboard/index'

  get 'main/index'
  root 'main#index'
  devise_for :users, only: [:passwords, :sessions, :registrations]

  #devise
  #post 'users/sign_in', as: :user_session, controller: 'devise/sessions', action: :create
  #get  'users/sign_in', as: :new_user_session, controller: 'devise/sessions', action: :new
  #delete 'users/sign_out', as: :destroy_user_session, controller: 'devise/sessions', action: :destroy



  resources :contests, only: [:index, :show] do
    resources :challenges, only: [:index, :show]
  end
  resources :users, only: [:index, :show] do
    resources :contests, only: :index
  end
end
