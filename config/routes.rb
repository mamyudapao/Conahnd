Rails.application.routes.draw do
  # micropostsコントローラーの追加ルーティング
  get '/recruitments', to: 'recruitments#new'
  post '/recruitments', to: 'recruitments#create'
  get '/recruitments/show', to: 'recruitments#show'
  # Likeのルーティング（未実装）
  get 'likes/create'
  get 'likes/destroy'
  root "static_pages#home"
  #検索用
  get 'search' , to: 'static_pages#search'
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
