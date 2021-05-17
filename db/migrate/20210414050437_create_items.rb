class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.string :image
      #t.string :images, array: true, default: [].to_yaml
      t.integer :amount_saved
      t.integer :amount_bought
      t.float :price
      t.timestamps
    end
    add_index :items, :id
  end
end
