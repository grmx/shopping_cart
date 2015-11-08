Rails.application.routes.draw do
  devise_for :users
  mount ShoppingCart::Engine => "/shopping_cart"
  root 'books#index'
  resources :books, only: :index
  resources :pens, only: :index
end
