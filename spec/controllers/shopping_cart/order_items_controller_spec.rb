module ShoppingCart
  RSpec.describe OrderItemsController, type: :controller do
    routes { ShoppingCart::Engine.routes }

    let(:book) { create(:book) }

    sign_in_user

    describe 'POST #create' do
      context 'with valid attributes' do
        it 'saves an order_item in the database' do
          expect { post :create, product_id: book.id }
            .to change(OrderItem, :count).by(1)
        end

        it 'assigns a notice message' do
          post :create, product_id: book.id
          expect(flash.notice).not_to be_nil
        end

        it 'redirects to root_path' do
          post :create, product_id: book.id
          expect(response).to redirect_to cart_path
        end
      end

      context 'with invalid attributes' do
        it 'generates RecordNotFound error without post params' do
          expect { post :create, product_id: 'abcd' }
            .to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end

    describe 'PUT #update' do
      let!(:order) { create(:shopping_cart_order, user: @user) }
      let!(:order_item) { create(:shopping_cart_order_item, order: order) }

      it 'updates order items quantity' do
        expect { put :update, id: order_item.id, order_item: { quantity: 2 } }
          .to change { order.order_items.first.quantity }.from(1).to(2)
      end

      it 'assigns a notice message' do
        put :update, id: order_item.id, order_item: { quantity: 2 }
        expect(flash.notice).not_to be_nil
      end

      it 'redirects to the cart' do
        put :update, id: order_item.id, order_item: { quantity: 2 }
        expect(response).to redirect_to cart_path
      end
    end

    describe 'DELETE #destroy' do
      let(:order) { create(:shopping_cart_order, user: @user) }
      let!(:order_item) { create(:shopping_cart_order_item, order: order) }

      it 'deletes an order item' do
        expect { delete :destroy, id: order_item }
          .to change(OrderItem, :count).by(-1)
      end

      it 'assigns a notice message' do
        delete :destroy, id: order_item
        expect(flash.notice).not_to be_nil
      end

      it 'redirects to the cart' do
        delete :destroy, id: order_item
        expect(response).to redirect_to cart_path
      end
    end
  end
end
