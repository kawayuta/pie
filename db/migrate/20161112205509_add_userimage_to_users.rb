class AddUserimageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar, :string, default: 'cherry.jpg'
  end
end
