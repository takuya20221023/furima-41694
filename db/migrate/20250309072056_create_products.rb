class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_fee_id
      t.integer :prefecture_id
      t.integer :shipping_day_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
