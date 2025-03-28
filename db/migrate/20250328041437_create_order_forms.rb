class CreateOrderForms < ActiveRecord::Migration[7.1]
  def change
    create_table :order_forms do |t|

      t.timestamps
    end
  end
end
