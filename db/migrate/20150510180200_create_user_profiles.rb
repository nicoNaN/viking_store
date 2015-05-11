class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :phone_number
      t.integer :shipping_address_id
      t.integer :billing_address_id
      t.integer :cc_id
      t.integer :cart_id

      t.timestamps null: false
    end
  end
end
