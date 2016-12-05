class AddOperatorToPresents < ActiveRecord::Migration[5.0]
  def change
    add_column :presents, :created_by, :integer
    add_column :presents, :updated_by, :integer
  end
end
