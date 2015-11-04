require "shopping_cart/engine"
require "shopping_cart/acts_as_user"
require "aasm"
require "wicked"
require "countries"
require "country_select"

module ShoppingCart
  mattr_accessor :user_class
  mattr_accessor :product_class

  def self.user_class
    @@user_class.constantize
  end

  def self.product_class
    @@product_class.constantize
  end
end
