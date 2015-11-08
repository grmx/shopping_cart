module ShoppingCart
  module ActsAsEngine
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_customer
        ShoppingCart.customer_class = self.name

        class_eval do
          has_many :orders, class_name: 'ShoppingCart::Order',
                            dependent: :destroy
          has_one :credit_card, class_name: 'ShoppingCart::CreditCard',
                                dependent: :destroy
        end
      end

      def acts_as_product
        ShoppingCart.product_class = self.name
      end
    end
  end
end

ActiveRecord::Base.send(:include, ShoppingCart::ActsAsEngine)
