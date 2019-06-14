Rails.application.routes.draw do
  root "static_pages#home"
  get '/rule',to: "static_pages#rule"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
