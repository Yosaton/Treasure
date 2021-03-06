Rails.application.routes.draw do
  get 'sessions/new'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :user
  resources :listings
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
end
