class ChangePriceToString < ActiveRecord::Migration
  def change
     remove_column :posts, :price
      add_column :posts, :total_cost, :string
  end
end
