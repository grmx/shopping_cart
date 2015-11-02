FactoryGirl.define do
  factory :shopping_cart_delivery, :class => 'ShoppingCart::Delivery' do
    name { Faker::Lorem.sentence }
    price "9.99"
  end

end
