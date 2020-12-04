Rails.application.routes.draw do
  root 'books#home'
  devise_for :users
  resources :books
  get 'home/about' => 'books#about',as: "about"
  resources :users, only: [:show, :edit, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
