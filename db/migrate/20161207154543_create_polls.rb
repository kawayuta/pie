class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|

		t.integer :user_id
		t.integer :present_id
		t.integer :poll_id
		t.integer :poll_age
		t.boolean :poll_check, :default => 0, :null => false
      t.timestamps
    end
  end
end
