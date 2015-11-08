module ShoppingCart
  RSpec.describe CartsController, type: :controller do
    routes { ShoppingCart::Engine.routes }

    sign_in_user

    let!(:order) { create(:order_with_items, customer: @user) }

    describe 'GET #show' do
      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'returns a current order items' do
        get :show
        expect(assigns(:order_items))
          .to eq order.order_items.order('created_at DESC')
      end

      it 'renders index view' do
        get :show
        expect(response).to render_template :show
      end
    end

    describe 'PUT #update' do
      it 'updates order items quantity' do
        expect do
          post :update, order_items:
          { "#{order.order_items.first.id}": { quantity: 2 } }
        end.to change { order.order_items.first.quantity }.from(1).to(2)
      end

      it 'assigns a notice message' do
        post :update,
             order_items: { "#{order.order_items.first.id}": { quantity: 2 } }
        expect(flash.notice).not_to be_nil
      end

      it 'redirects to the cart' do
        post :update,
             order_items: { "#{order.order_items.first.id}": { quantity: 2 } }
        expect(response).to redirect_to cart_path
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes all order items from the cart' do
        expect { delete :destroy }.to change(order.order_items, :count)
          .from(3).to(0)
      end

      it 'assigns a notice message' do
        delete :destroy
        expect(flash.notice).not_to be_nil
      end

      it 'redirects to the cart' do
        delete :destroy
        expect(response).to redirect_to cart_path
      end
    end
  end
end
