class CreateCollectionrelations < ActiveRecord::Migration[5.0]
  def change
    create_table :collectionrelations do |t|
      
      t.integer   :relay_get_post_id
      t.integer   :relay_user_id
      t.string  :relay_collection_title

      t.timestamps
    end
  end
end
