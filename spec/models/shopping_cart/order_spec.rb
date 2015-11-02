module ShoppingCart
  RSpec.describe Order, type: :model do
    describe 'validation' do
      it { should validate_presence_of(:total_price) }
      it { should validate_presence_of(:state) }
      it do
        should validate_numericality_of(:total_price).
          is_greater_than_or_equal_to(0.01)
      end
      it do
        should validate_inclusion_of(:state).
          in_array(%w(in_progress in_queue in_delivery delivered canceled))
      end
    end

    describe 'associations' do
      it { should belong_to(:user).class_name('User') }
      it { should have_many(:order_items).dependent(:destroy) }
      it { should belong_to(:billing_address).class_name('Address').autosave(true) }
      it { should belong_to(:shipping_address).class_name('Address').autosave(true) }
      it { should belong_to(:delivery) }
    end

    describe 'additional methods' do
      let(:book) { create(:book) }
      let!(:order) { build(:shopping_cart_order) }

      before { order.add_book(book) }

      describe '.add_book' do
        it 'adds a book to the order' do
          expect(order.order_items.first.book).to eq book
        end

        it 'doesn\'t return the same book twice' do
          expect { order.add_book(book) }.to_not change { order.order_items }
        end

        it 'changes order item quantity' do
          expect { order.add_book(book) }.
            to change { order.order_items.first.quantity }.from(1).to(2)
        end
      end

      describe '.calc_total_price' do
        it 'returns total price for an order item' do
          expect(order.calc_total_price).to eq book.price
        end

        xit 'returns total price for several order items' do
          order.add_book(book)
          expect { order.calc_total_price }.
            to change { order.total_price }.from(book.price).to(book.price * 2)
        end
      end
    end
  end
end
