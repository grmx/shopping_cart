RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:orders) { create_list(:shopping_cart_order, 3, customer: user) }

  it do
    should have_many(:orders).class_name('ShoppingCart::Order')
      .dependent(:destroy)
  end

  it do
    should have_one(:credit_card).class_name('ShoppingCart::CreditCard')
      .dependent(:destroy)
  end

  it 'returns user orders' do
    expect(user.orders).to eq orders
  end
end
