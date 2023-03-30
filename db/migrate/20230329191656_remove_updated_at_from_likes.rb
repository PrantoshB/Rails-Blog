class RemoveUpdatedAtFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :UpdatedAt, :datetime
  end
end
