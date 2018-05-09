class ChangeDefaultForProductlistQuantity < ActiveRecord::Migration[5.1]
  def change
    change_column :productlists, :quantity, :integer, :default => 1
  end
end
