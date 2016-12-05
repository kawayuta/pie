class CreateGets < ActiveRecord::Migration[5.0]
  def change
    create_table :gets do |t|
      t.string :title
      t.string :getimage
      t.text :body
      t.integer :price

      t.timestamps
    end
  end
end
