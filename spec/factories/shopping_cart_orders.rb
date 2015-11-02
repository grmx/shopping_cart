FactoryGirl.define do
  factory :shopping_cart_order, :class => 'ShoppingCart::Order' do
    total_price "9.99"
    state "in_progress"
    user
    delivery { create :shopping_cart_delivery }
    completed_at Time.now
    association :billing_address,  factory: :shopping_cart_address
    association :shipping_address, factory: :shopping_cart_address

    factory :order_with_items do
      after(:create) do |order|
        create_list(:shopping_cart_order_item, 3, order: order)
      end
    end
 end

end
