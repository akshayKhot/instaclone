Rails.application.routes.draw do
  get 'friend_requests/index'
  get 'friend_requests/add_friend'
  get 'friend_requests/accept'
  get 'friend_requests/decline'
  get 'friend_requests/pending'
  get 'friend_requests/friends'
  devise_for :users

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end

  resources :profiles, only: [:index]
  get 'profiles/:username', to: 'profiles#show', as: :profile

  resources :photos, only: [:index, :show, :new, :create, :destroy]

  resources :comments, only: [:create, :edit, :update, :destroy]

  root 'photos#index'

  get '*path', to: 'photos#index', constraints: lambda { |req| req.path.exclude? 'rails/active_storage' }
end
