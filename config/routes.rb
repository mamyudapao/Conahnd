Rails.application.routes.draw do
  root "static_pages#home"
  get '/rule',to: "static_pages#rule"
  resources :users
end
