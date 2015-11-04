module ShoppingCart
  module ActsAsUser
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_user
        extend_user(self)
      end

      private

      def extend_user(user_class)
        user_class.send(:has_many, :orders, { dependent: :destroy,
          class_name: 'ShoppingCart::Order'})
        user_class.send(:has_one, :credit_card, { dependent: :destroy,
          class_name: 'ShoppingCart::CreditCard'})
       end
    end
  end
end

ActiveRecord::Base.send(:include, ShoppingCart::ActsAsUser)
