class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
    change_table :users do |t|
      t.integer :profile_id
    end
  end
end
