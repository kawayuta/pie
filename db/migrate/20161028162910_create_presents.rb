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
      t.string :poll_1
      t.string :poll_2
      t.string :poll_3
      t.string :poll_4

      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
