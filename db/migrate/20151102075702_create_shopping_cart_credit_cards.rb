class CreateShoppingCartCreditCards < ActiveRecord::Migration
  def change
    create_table :shopping_cart_credit_cards do |t|
      t.string :number, limit: 16
      t.string :exp_month, limit: 2
      t.string :exp_year, limit: 4
      t.string :cvv, limit: 3
      t.belongs_to :customer, polymorphic: true

      t.timestamps null: false
    end
  end
end
