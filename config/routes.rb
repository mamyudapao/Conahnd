Rails.application.routes.draw do
  root "static_pages#home"
  get '/rule',to: "static_pages#rule"
  get '/status', to: 'static_pages#status'
  resources :users

  get '/login' , to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to:"sessions#destroy"
end
