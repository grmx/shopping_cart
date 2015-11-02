require "shopping_cart/engine"

module ShoppingCart
  mattr_accessor :user_class

  def self.user_class
    @@user_class.constantize
  end
end
