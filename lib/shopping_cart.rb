require "shopping_cart/engine"
require "shopping_cart/acts_as_customer"
require "aasm"
require "wicked"
require "countries"
require "country_select"

module ShoppingCart
  mattr_accessor :customer_class
  mattr_accessor :product_class

  def self.customer_class
    @@customer_class.constantize
  end

  def self.product_class
    @@product_class.constantize
  end
end
