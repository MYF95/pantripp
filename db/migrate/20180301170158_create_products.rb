class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.text :ingredients
      t.text :info
      t.integer :shelf

      t.timestamps
    end
    add_index :products, :name
  end
end
