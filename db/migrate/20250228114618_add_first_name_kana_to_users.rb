class AddFirstNameKanaToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :First_name_kana, :string
  end
end
