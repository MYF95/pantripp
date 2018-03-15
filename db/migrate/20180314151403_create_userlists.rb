class CreateUserlists < ActiveRecord::Migration[5.1]
  def change
    create_table :userlists do |t|
      t.integer :user_id
      t.integer :list_id

      t.timestamps
    end
    add_index :userlists, :user_id
    add_index :userlists, :list_id
    add_index :userlists, [:user_id, :list_id], unique: true
  end
end
