class AddArrayAsOrder < ActiveRecord::Migration
  def change
    remove_column :posts, :extra
    add_column :posts, :full_order, :text, array:true, default: []
  end
end
