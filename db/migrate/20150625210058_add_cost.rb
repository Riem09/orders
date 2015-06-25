class AddCost < ActiveRecord::Migration
  def change
    add_column :posts, :price, :string
  end
end
