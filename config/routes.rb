Rails.application.routes.draw do
  root :to => 'users#new'

  resources :users do
    resources :questions
  end
  resources :sessions
end
