feature 'Delete book from cart' do
  given(:user) { create(:user) }
  given!(:book) { create(:book) }

  background do
    login_as user
    visit books_path
  end

  scenario 'Authorized user deletes the book from the Cart' do
    click_on 'Add to cart'

    expect(current_path).to eq shopping_cart.cart_path
    expect(page).to have_content 'Product successfully added to Shopping Cart'
    expect(page).to have_content book.title
    click_on 'Delete'

    expect(page).to_not have_content book.title
    expect(page).to have_content 'Your shopping cart is empty'
  end
end
