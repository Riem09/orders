class RemoveOrderFullAndCost < ActiveRecord::Migration
  def change
    remove_column :posts, :total_cost, :string
    remove_column :posts, :order_full
    add_column :posts, :order_cost, :string
  end
end
