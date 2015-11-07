require 'rails/generators/base'

module ShoppingCart
  class ViewsGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def copy_views
      directory 'carts', 'app/views/shopping_cart/carts'
      directory 'order_steps', 'app/views/shopping_cart/order_steps'
      directory 'orders', 'app/views/shopping_cart/orders'
    end
  end
end
