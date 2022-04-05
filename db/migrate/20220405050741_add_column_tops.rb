class AddColumnTops < ActiveRecord::Migration[5.2]
  def change
    add_column :tops, :user_image, :string
  end
end
