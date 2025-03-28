class CreateOrderAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :order_addresses do |t|
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.references :order, null: false, foreign_key: true  # order_idが必要
      t.string :token, null: false

      t.timestamps
    end
  end
end
