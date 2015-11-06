require_dependency "shopping_cart/application_controller"

module ShoppingCart
  class CartsController < ApplicationController
    def show
      @order = current_order
      @order_items = current_order.order_items.order('created_at DESC')
    end

    def update
      order_update(current_order)
      flash[:success] = 'The Cart successfully updated.'
      redirect_to cart_path
    end

    def destroy
      current_order.empty!
      flash[:warning] = 'The Cart successfully emptied.'
      redirect_to cart_path
    end

    private

    def order_update(order)
      order.order_items.update(order_item_params.keys, order_item_params.values)
      order.calc_total_price
      order.save
    end

    def order_item_params
      params.require(:order_items).permit(params[:order_items].keys.
        map { |id| { "#{id}": [:quantity] } })
    end
  end
end
