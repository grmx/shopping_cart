FactoryGirl.define do
  factory :shopping_cart_credit_card, :class => 'ShoppingCart::CreditCard' do
    number { Faker::Business.credit_card_number.remove('-') }
    exp_month 2
    exp_year 2017
    cvv { Faker::Number.number(3) }
    user nil
  end

end
