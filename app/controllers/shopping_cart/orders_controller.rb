require_dependency 'shopping_cart/application_controller'

module ShoppingCart
  class OrdersController < ApplicationController
    def index
      orders = current_user.orders
      @in_progress = orders.in_progress.first
      @in_queue = orders.in_queue
      @in_delivery = orders.in_delivery
      @delivered = orders.delivered
    end

    def show
      @order = current_user.orders.find(params[:id])
    end
  end
end
