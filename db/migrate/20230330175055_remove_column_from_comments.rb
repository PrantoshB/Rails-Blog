class RemoveColumnFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :users_id, :bigint
  end
end
