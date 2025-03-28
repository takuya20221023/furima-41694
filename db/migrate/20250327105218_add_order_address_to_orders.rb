class AddOrderAddressToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :order_address, :string
  end
end
