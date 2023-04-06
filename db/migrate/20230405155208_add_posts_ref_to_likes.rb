class AddPostsRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, foreign_key: true
  end
end
