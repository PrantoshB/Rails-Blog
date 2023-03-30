class RemoveColumnsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :UpdatedAt, :string
    remove_column :users, :CreatedAt, :string
  end
end
