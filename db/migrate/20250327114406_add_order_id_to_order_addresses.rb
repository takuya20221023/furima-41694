class AddOrderIdToOrderAddresses < ActiveRecord::Migration[7.1]
  def change
    add_reference :order_addresses, :order, null: false, foreign_key: true
  end
end
