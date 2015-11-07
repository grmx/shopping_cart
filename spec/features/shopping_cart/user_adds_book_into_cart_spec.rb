module ShoppingCart
  feature 'Add book into cart' do
    given(:user) { create(:user) }
    given!(:book) { create(:book) }

    background do
      login_as user
      visit books_path
    end

    scenario 'Authorized user adds the book to the Cart' do
      click_on 'Add to cart'
      expect(page).to have_content 'Product successfully added to Shopping Cart'
    end

    scenario 'Authorized user adds several books to the Cart' do
      click_on 'Add to cart'

      expect(page).to have_content 'Product successfully added to Shopping Cart'
      expect(current_path).to eq shopping_cart.cart_path

      fill_in 'qty', with: '2'
      click_on 'Update Cart'

      expect(page).to have_content 'Shopping Cart successfully updated'
    end

    scenario 'Authorized user adds the book to the Cart twice' do
      click_on 'Add to cart'
      expect(page).to have_content book.price
      visit books_path
      click_on 'Add to cart'
      expect(page).to have_content(book.price * 2)
    end
  end
end
