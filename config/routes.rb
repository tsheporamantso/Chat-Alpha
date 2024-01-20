Rails.application.routes.draw do
  get 'users/new'

  root "pages#home"
  get "/about", to: "pages#about"
  resources :articles
  get "/signup", to: "users#new"
end
