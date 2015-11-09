require_dependency 'shopping_cart/application_controller'

module ShoppingCart
  class CartsController < ApplicationController
    def show
      @order_items = current_order.order_items
    end

    def update
      order_update(current_order)
      redirect_to cart_path, notice: t('cart.updated')
    end

    def destroy
      current_order.empty!
      redirect_to cart_path, notice: t('cart.emptied')
    end

    private

    def order_update(order)
      order.order_items.update(order_item_params.keys, order_item_params.values)
    end

    def order_item_params
      params.require(:order_items).permit(params[:order_items].keys
        .map { |id| { "#{id}": [:quantity] } })
    end
  end
end
