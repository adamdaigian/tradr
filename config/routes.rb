Tradr::Application.routes.draw do
  match "logout" => 'sessions#destroy', as: "logout"
  match "login" => 'sessions#new', as: "login"

  post "sessions/create"

  resources :stocks

  resources :users

  root to: 'stocks#index'
end
