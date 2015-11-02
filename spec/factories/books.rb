FactoryGirl.define do
  factory :book do
    title { Faker::Book.title }
    price { Faker::Commerce.price }
  end

end
