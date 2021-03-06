module ShoppingCart
  RSpec.describe OrderItem, type: :model do
    describe 'validation' do
      it { should validate_presence_of(:price) }
      it { should validate_presence_of(:quantity) }
      it do
        should validate_numericality_of(:price)
          .is_greater_than_or_equal_to(0.01)
      end
      it { should validate_numericality_of(:quantity).is_greater_than(0) }
    end

    describe 'associations' do
      it { should belong_to(:product) }
      it { should belong_to(:order) }
    end
  end
end
