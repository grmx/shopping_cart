require 'shopping_cart/engine'
require 'shopping_cart/acts_as_engine'
require 'aasm'
require 'wicked'
require 'countries'
require 'country_select'

module ShoppingCart
  mattr_accessor :customer_class

  PRODUCTS = []

  def self.customer_class
    @@customer_class.constantize
  end
end
