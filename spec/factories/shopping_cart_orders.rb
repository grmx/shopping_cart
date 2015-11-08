FactoryGirl.define do
  factory :shopping_cart_order, :class => 'ShoppingCart::Order' do
    total_price "9.99"
    state "in_progress"
    customer { create :user }
    delivery { create :shopping_cart_delivery }
    completed_at Time.now
    association :billing_address,  factory: :shopping_cart_address
    association :shipping_address, factory: :shopping_cart_address

    factory :order_with_items do
      after(:create) do |order|
        create_list(:shopping_cart_order_item, 3, order: order)
      end
    end

    factory :blank_order do
      billing_address nil
      shipping_address nil
      delivery nil
    end

    trait :random_state do
      state { %w(in_progress in_queue in_delivery delivered canceled).sample }
    end

    factory :order_with_random_state, traits: [:random_state]
  end
end
