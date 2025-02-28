class AddLastNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :Last_name, :string
  end
end
