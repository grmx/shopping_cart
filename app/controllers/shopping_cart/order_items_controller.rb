require_dependency 'shopping_cart/application_controller'

module ShoppingCart
  class OrderItemsController < ApplicationController
    def create
      product = ShoppingCart.product_class.find(params[:product_id])
      order = current_order
      order.add_product(product)
      order.calc_total_price
      order.save
      redirect_to cart_path, notice: t('product.added')
    end

    def update
      order_item = OrderItem.find(params[:id])
      order_item.update(order_item_params)
      order_item.order.calc_total_price
      order_item.order.save
      redirect_to cart_path, notice: t('product.updated')
    end

    def destroy
      order_item = OrderItem.find(params[:id])
      order_item.destroy
      order = order_item.order
      order.calc_total_price
      order.save
      redirect_to cart_path, notice: t('product.deleted')
    end

    private

    def order_item_params
      params.require(:order_item).permit(:id, :quantity)
    end
  end
end
