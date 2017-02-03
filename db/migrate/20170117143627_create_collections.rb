class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.text :collection_name
      t.text :collection_detaile


      t.timestamps
    end
  end
end
