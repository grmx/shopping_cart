class CreateShoppingCartDeliveries < ActiveRecord::Migration
  def change
    create_table :shopping_cart_deliveries do |t|
      t.string :name
      t.decimal :price, precision: 5, scale: 2

      t.timestamps null: false
    end
  end
end
