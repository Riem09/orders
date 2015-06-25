class ChangeToText < ActiveRecord::Migration
  def change
      remove_column :posts, :full_order
      add_column :posts, :order_full, :text
  end
end
