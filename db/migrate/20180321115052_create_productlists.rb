class CreateProductlists < ActiveRecord::Migration[5.1]
  def change
    create_table :productlists do |t|
      t.integer :product_id
      t.integer :list_id
      t.integer :quantity

      t.timestamps
    end
    add_index :productlists, :product_id
    add_index :productlists, :list_id
    add_index :productlists, [:product_id, :list_id], unique:true
  end
end
