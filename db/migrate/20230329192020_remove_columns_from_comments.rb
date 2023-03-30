class RemoveColumnsFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :AuthorId, :string
    remove_column :comments, :PostId, :string
    remove_column :comments, :UpdatedAt, :string
    remove_column :comments, :CreatedAt, :string
  end
end
