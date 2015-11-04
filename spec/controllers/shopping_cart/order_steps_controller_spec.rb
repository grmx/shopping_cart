module ShoppingCart
  RSpec.describe OrderStepsController, type: :controller do
    routes { ShoppingCart::Engine.routes }

    sign_in_user

    let!(:order){ create(:blank_order, user: @user) }
    let!(:form){ CheckoutForm.new(order) }

    describe 'GET #show' do
      context 'billing address' do
        before { get :show, id: :billing_address }

        it 'renders a template' do
          expect(response).to render_template :billing_address
        end
      end

      context 'shipping address' do
        it 'renders a template' do
          get :show, { id: :shipping_address }, { billing_address: true }
          expect(response).to render_template :shipping_address
        end

        it 'redirects to the billing address unless shipping address filled' do
          get :show, id: :shipping_address
          expect(response).to redirect_to(action: :show, id: :billing_address)
        end
      end

      context 'delivery' do
        it 'renders a template' do
          get :show, { id: :delivery }, { shipping_address: true }
          expect(response).to render_template :delivery
        end

        it 'redirects to the shipping address unless delivery chosen' do
          get :show, id: :delivery
          expect(response).to redirect_to(action: :show, id: :shipping_address)
        end
      end

      context 'credit card' do
        it 'renders a template' do
          get :show, { id: :payment }, { delivery: true }
          expect(response).to render_template :payment
        end

        it 'redirects to the delivery unless credit card filled' do
          get :show, id: :payment
          expect(response).to redirect_to(action: :show, id: :delivery)
        end
      end

      context 'confirm' do
        it 'renders a template' do
          get :show, { id: :confirm }, { payment: true }
          expect(response).to render_template :confirm
        end

        it 'redirects to the payment unless confirmed' do
          get :show, id: :confirm
          expect(response).to redirect_to(action: :show, id: :payment)
        end
      end

      context 'complete' do
        it 'renders a template' do
          get :show, { id: :complete }, { confirm: true }
          expect(response).to render_template :complete
        end

        it 'redirects to the confirmation' do
          get :show, id: :complete
          expect(response).to redirect_to(action: :show, id: :confirm)
        end
      end
    end

    describe 'PATCH #update' do
      before do
        @params = { id: :billing_address, billing_address:
          attributes_for(:shopping_cart_address) }

        allow(form).to receive(:update).and_return(true)
        allow(form).to receive(:save).and_return(true)
      end

      it 'builds an order form' do
        patch :update, @params
        expect(assigns(:form)).not_to be_nil
      end

      it 'renders steps' do
        patch :update, @params
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  end
end
