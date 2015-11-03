module ShoppingCart
  RSpec.describe CheckoutForm do
    let(:user) { create(:user) }
    let(:order) { create(:shopping_cart_order, user: user) }

    subject { CheckoutForm.new(order) }

    it { expect(subject).to respond_to(:billing_address) }
    it { expect(subject).to respond_to(:shipping_address) }
    it { expect(subject).to respond_to(:deliveries) }
    it { expect(subject).to respond_to(:payment) }
    it { expect(subject).to respond_to(:save) }

    describe '#save_billing_address' do
      let(:address) { attributes_for(:shopping_cart_address) }

      context 'creates a new billing address' do
        before do
          subject.save_billing_address(address)
        end

        it 'saves attributes' do
          expect(subject.billing_address.first_name).to eq address[:first_name]
          expect(subject.billing_address.address).to eq address[:address]
        end
      end

      context 'updates an exists billing address' do
        before do
          order.billing_address = create(:shopping_cart_address)
          subject.save_billing_address(address)
        end

        it 'updates attributes' do
          expect(subject.billing_address.first_name).to eq address[:first_name]
          expect(subject.billing_address.address).to eq address[:address]
        end
      end
    end

    describe '#save_shipping_address' do
      let(:address) { attributes_for(:shopping_cart_address) }

      context 'creates a new shipping address' do
        before do
          subject.save_shipping_address(address)
        end

        it 'saves attributes' do
          expect(subject.shipping_address.first_name).to eq address[:first_name]
          expect(subject.shipping_address.address).to eq address[:address]
        end
      end

      context 'updates an exists shipping address' do
        before do
          order.shipping_address = create(:shopping_cart_address)
          subject.save_shipping_address(address)
        end

        it 'updates attributes' do
          expect(subject.shipping_address.first_name).to eq address[:first_name]
          expect(subject.shipping_address.address).to eq address[:address]
        end
      end
    end
  end
end
