feature 'User places order' do
  given(:user) { create(:user) }
  given!(:book) { create(:book) }
  given(:address) { create(:shopping_cart_address) }
  given(:cc) { create(:shopping_cart_credit_card) }
  given!(:deliveries) { create_list(:shopping_cart_delivery, 3) }

  background do
    login_as user
    visit books_path
    click_on 'Add to cart'
    click_on 'Checkout'
  end

  scenario 'A user fills in a checkout form' do
    expect(page).to have_css 'a h4', text: 'Step 1'
    expect(page).to have_css 'h3', text: 'Billing Address'

    fill_in 'First name',     with: address.first_name
    fill_in 'Last name',      with: address.last_name
    fill_in 'Street address', with: address.address
    fill_in 'City',           with: address.city
    select  address.country,  from: 'address_country'
    fill_in 'Zipcode',        with: address.zipcode
    fill_in 'Phone',          with: address.phone
    click_on 'Save and continue'

    expect(page).to have_css 'a h4', text: 'Step 2'
    expect(page).to have_css 'h3', text: 'Shipping Address'

    fill_in 'First name',     with: address.first_name
    fill_in 'Last name',      with: address.last_name
    fill_in 'Street address', with: address.address
    fill_in 'City',           with: address.city
    select  address.country,  from: 'address_country'
    fill_in 'Zipcode',        with: address.zipcode
    fill_in 'Phone',          with: address.phone
    click_on 'Save and continue'

    expect(page).to have_css 'a h4', text: 'Step 3'
    expect(page).to have_css 'h3', text: 'Delivery'

    choose deliveries.first.name
    click_on 'Save and continue'

    expect(page).to have_css 'a h4', text: 'Step 4'
    expect(page).to have_css 'h3', text: 'Credit card'

    fill_in 'Number',    with: cc.number
    select cc.exp_month, from: 'credit_card_exp_month'
    select cc.exp_year,  from: 'credit_card_exp_year'
    fill_in 'Card Code', with: cc.cvv
    click_on 'Save and continue'

    expect(page).to have_css 'a h4', text: 'Step 5'
    expect(page).to have_css 'h3', text: 'Confirm'
    expect(page).to have_content book.title
    expect(page).to have_content book.price

    click_on 'Place Order'

    expect(page).to_not have_css 'a h4', text: 'Step 6'
    expect(page).to_not have_css 'h3', text: 'Complete'
    expect(page).to have_content book.title
    expect(page).to have_content book.price

    click_on 'Go back to the store'

    expect(current_path).to eq main_app.root_path
  end
end
