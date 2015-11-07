RSpec.describe Book, type: :model do
  it 'sets a product_class variable' do
    expect(ShoppingCart.product_class).to eq Book
  end
end
