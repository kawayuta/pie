class AddOperatorToGet < ActiveRecord::Migration[5.0]
  def change
    add_column :gets, :created_by, :integer
    add_column :gets, :updated_by, :integer
  end
end
