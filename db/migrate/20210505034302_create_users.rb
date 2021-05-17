class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :twitter_id, null: true
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
    end
    add_index :users, :id
  end
end
