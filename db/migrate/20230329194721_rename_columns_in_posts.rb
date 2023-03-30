class RenameColumnsInPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :Title, :title
    rename_column :posts, :Text, :text
    rename_column :posts, :CommentsCounter, :comments_counter
    rename_column :posts, :LikesCounter, :likes_counter
  end
end
