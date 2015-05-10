class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :phone_number
      t.integer :billing_address_id
      t.integer :cc_id
      t.integer :cart_id

      t.timestamps null: false
    end
    change_table :user_profiles do |t|
      t.integer :shipping_address_id
    end
  end
end
