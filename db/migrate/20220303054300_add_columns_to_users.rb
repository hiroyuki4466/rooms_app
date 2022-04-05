class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_id, :integer
    add_column :users, :user_image, :string
    add_column :users, :user_introduction, :string
  end
end
