class RemoveCreatedAtFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :CreatedAt, :datetime
  end
end
