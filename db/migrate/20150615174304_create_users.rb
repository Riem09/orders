class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :posts
      t.string :name
      t.string :email
      t.string :contact
      t.timestamps null: false
    end
  end
end
