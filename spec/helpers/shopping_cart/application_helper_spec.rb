module ShoppingCart
  RSpec.describe ApplicationHelper, type: :helper do
    let!(:order) { create(:shopping_cart_order) }

    describe '#cart_counter' do
      it 'doesnt display unless an order exists' do
        allow(helper).to receive(:current_order).and_return(nil)
        expect(helper.cart_counter).to eq nil
      end

      it 'returns an order counter' do
        allow(helper).to receive(:current_order).and_return(order)
        expect(helper.cart_counter).to eq order.order_items.count
      end
    end

    describe '#order_total_price' do
      it 'doesnt display if cart is empty' do
        order_blank = create(:blank_order)
        allow(helper).to receive(:current_order).and_return(order_blank)
        expect(helper.order_total_price).to eq nil
      end
    end
  end
end
