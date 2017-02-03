class AddShopnameToGets < ActiveRecord::Migration[5.0]
  def change
    add_column :gets, :shopcat, :text
  end
end
