class AddBirthDateToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :Birth_date, :date
  end
end
