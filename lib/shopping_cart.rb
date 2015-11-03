require "shopping_cart/engine"
require "aasm"
require "wicked"
require "countries"
require "country_select"

module ShoppingCart
  mattr_accessor :user_class

  def self.user_class
    @@user_class.constantize
  end
end
