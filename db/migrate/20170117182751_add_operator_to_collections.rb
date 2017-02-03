class AddOperatorToCollections < ActiveRecord::Migration[5.0]
  def change
  	
    add_column :collections, :created_by, :integer
    add_column :collections, :updated_by, :integer
  end
end
