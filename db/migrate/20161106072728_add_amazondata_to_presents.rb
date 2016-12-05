class AddAmazondataToPresents < ActiveRecord::Migration[5.0]
  def change
    add_column :presents, :amazon_url, :string
    add_column :presents, :amazon_title, :string
    add_column :presents, :amazon_price, :integer
  end
end
