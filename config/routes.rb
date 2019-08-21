Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  root "static_pages#home"
  get '/rule',to: "static_pages#rule"
  get '/status', to: 'static_pages#status'
  get '/login' , to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to:"sessions#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts,  only:[:create, :destroy]
  resources :relationships,  only:[:create, :destroy]
  resources :likes, only: [:create, :destroy]
end
