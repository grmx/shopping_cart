module ShoppingCart
  module ActsAsCustomer
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_customer
        ShoppingCart.customer_class = self.name
        extend_customer(self)
      end

      private

      def extend_customer(customer_class)
        customer_class.send(:has_many, :orders, { dependent: :destroy,
          class_name: 'ShoppingCart::Order'})
        customer_class.send(:has_one, :credit_card, { dependent: :destroy,
          class_name: 'ShoppingCart::CreditCard'})
      end
    end
  end
end

ActiveRecord::Base.send(:include, ShoppingCart::ActsAsCustomer)
