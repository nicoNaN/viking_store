class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :sku
      t.integer :category_id

      t.timestamps null: false
    end
    change_table :product do |t|
      t.remove :sku
      t.string :sku
    end
  end
end
