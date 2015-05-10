class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :shipping_address_id
      t.integer :billing_address_id
      t.integer :cc_id
      t.boolean :in_cart

      t.timestamps null: false
    end
  end
end
