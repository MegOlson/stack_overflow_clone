Rails.application.routes.draw do
  root :to => 'questions#index'

  resources :users do
    resources :questions
  end
  resources :questions do
    resources :answers
  end
  resources :sessions
end
