class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :name_on_card
      t.datetime :exp_date
      t.string :card_number
      t.integer :csc
      t.integer :profile_id

      t.timestamps null: false
    end
  end
end
