class CreateShoppingCartOrders < ActiveRecord::Migration
  def change
    create_table :shopping_cart_orders do |t|
      t.decimal :total_price, precision: 5, scale: 2
      t.string :state, default: 'in_progress'
      t.datetime :completed_at
      t.belongs_to :customer, polymorphic: true
      t.integer :billing_address_id
      t.integer :shipping_address_id
      t.references :delivery, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
