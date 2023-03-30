class RemoveUserIdFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :user_id, :bigint
  end
end
