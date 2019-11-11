Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users

  root 'diaries#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, :only => [:show]
  resources :diaries do
    resources :comments
    collection do
      post :confirm
      get :search
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :poses, :only => [:index]

  resources :admin, :only => [:index]

  namespace :admin do
    resources :users
    resources :poses
    resources :effects
    resources :tags
  end

  resources :conversations do
    resources :messages
  end

  resources :relationships, only: [:create, :destroy]
  resources :events
end
