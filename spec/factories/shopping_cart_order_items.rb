FactoryGirl.define do
  factory :shopping_cart_order_item, :class => 'ShoppingCart::OrderItem' do
    price "9.99"
    quantity 1
    book
    order { create :shopping_cart_order }
  end

end
