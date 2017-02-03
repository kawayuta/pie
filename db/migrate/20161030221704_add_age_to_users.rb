class AddAgeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :age, :string
    add_column :users, :birthday, :datetime

  end
end
