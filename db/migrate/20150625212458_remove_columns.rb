class RemoveColumns < ActiveRecord::Migration
  def change
    remove_column :posts, :price
    remove_column :posts, :order_cost
    rename_column :posts, :name, :final_cost
  end
end
