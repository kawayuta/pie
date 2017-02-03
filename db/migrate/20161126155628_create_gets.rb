class CreateGets < ActiveRecord::Migration[5.0]
  def change
    create_table :gets do |t|
      t.string :title
      t.string :getimage
      t.string :getimage_cache
      t.string :brand
      t.text :body
      t.integer :price

      t.integer :body_height
      t.integer :body_width
      t.integer :body_bust
      t.integer :body_west
      t.integer :body_hip
      t.integer :shoulder_width
      t.integer :leg_height
      t.integer :leg_width
      t.integer :foot_height
      t.integer :arm_height
      t.integer :arm_width
      t.integer :ring_finger_width


      t.float :latitude
      t.float :longitude
      
      t.string :get_cat

      t.boolean :location_check, :default => 1, :null => true

      t.timestamps
    end
  end
end
