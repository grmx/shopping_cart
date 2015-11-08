require_dependency 'shopping_cart/application_controller'

module ShoppingCart
  class OrderItemsController < ApplicationController
    before_action :load_product, only: :create
    before_action :load_order_item, only: [:update, :destroy]

    def create
      order = current_order
      order.add_product(@product)
      order.calc_total_price
      order.save
      redirect_to cart_path, notice: t('product.added')
    end

    def update
      @order_item.update(order_item_params)
      @order_item.order.calc_total_price
      @order_item.order.save
      redirect_to cart_path, notice: t('product.updated')
    end

    def destroy
      @order_item.destroy
      current_order.calc_total_price
      current_order.save
      redirect_to cart_path, notice: t('product.deleted')
    end

    private

    def load_product
      klass = ShoppingCart::PRODUCTS.map(&:constantize)
              .detect { |e| params["#{e.name.underscore}_id"] }
      @product = klass.find(params["#{klass.name.underscore}_id"])
    end

    def load_order_item
      @order_item = current_order.order_items.find(params[:id])
    end

    def order_item_params
      params.require(:order_item).permit(:id, :quantity)
    end
  end
end
