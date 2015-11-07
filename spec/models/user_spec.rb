RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:orders) { create_list(:shopping_cart_order, 3, user: user) }

  it 'sets a customer_class variable' do
    expect(ShoppingCart.customer_class).to eq User
  end

  it 'responds to Orders' do
    expect(user).to respond_to :orders
  end

  it 'responds to CreditCard' do
    expect(user).to respond_to :credit_card
  end

  it 'returns user orders' do
    expect(user.orders).to eq orders
  end
end
