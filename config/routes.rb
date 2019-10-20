Rails.application.routes.draw do
  devise_for :users
  root 'diaries#index'
  resources :diaries

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
