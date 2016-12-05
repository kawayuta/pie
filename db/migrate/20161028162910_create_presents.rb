class CreatePresents < ActiveRecord::Migration[5.0]
  def change
    create_table :presents do |t|

      t.string :title
      t.string :brand
      t.integer :price
      t.string :image
      t.integer :myage
      t.integer :youage
      t.string :cat
      t.string :man
      t.string :enquete

      t.timestamps
    end
  end
end
