ShoppingCart::Engine.routes.draw do
  resources :orders, only: [:index, :show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :order_steps, only: [:index, :show, :update]
  resource  :cart, only: [:show, :update, :destroy]
end
