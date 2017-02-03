class AddBodydataToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :body_height, :integer
    add_column :users, :body_width, :integer
    add_column :users, :body_bust, :integer
    add_column :users, :body_west, :integer
    add_column :users, :body_hip, :integer
    add_column :users, :shoulder_width, :integer
    add_column :users, :leg_height, :integer
    add_column :users, :leg_width, :integer
    add_column :users, :foot_height, :integer
    add_column :users, :arm_height, :integer
    add_column :users, :arm_width, :integer
    add_column :users, :ring_finger_width, :integer

  end
end
