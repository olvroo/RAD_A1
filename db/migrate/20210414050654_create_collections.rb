class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.string :name      
      t.integer :total_items
      t.timestamps
    end
    add_index :collections, :id
  end
end
