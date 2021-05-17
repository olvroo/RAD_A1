class CreateSavedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :saved_items do |t|
      t.integer :user_id
      t.integer :item_id
      t.timestamps
    end
    add_index :saved_items, :id
  end
end
