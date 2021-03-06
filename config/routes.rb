Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  get 'top', to: 'diaries#top'
  devise_for :users

  root 'diaries#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, :only => [:show, :edit, :update] do
    member do
      get :follow
    end
  end

  resources :diaries do
    resources :comments
    collection do
      post :confirm
      get :search
      get :ranking
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :poses, :only => [:index, :show] do
    collection do
      get :auto_complete
    end
  end

  resources :admin, :only => [:index]

  namespace :admin do
    resources :users
    resources :poses
    resources :effects
    resources :tags
    resources :requests
  end

  resources :conversations do
    resources :messages
  end

  resources :relationships, only: [:create, :destroy]
  resources :events do
    collection do
      post :confirm
    end
  end
  resources :requests, only: [:new, :create]
end
