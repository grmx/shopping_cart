module ShoppingCart
  class ApplicationController < ::ApplicationController
    helper_method :current_order

    def current_order
      current_user.orders.in_progress.first_or_create
    end
  end
end
