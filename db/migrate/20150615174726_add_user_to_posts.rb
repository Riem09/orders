class AddUserToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :users_id, :integer
  end
end
