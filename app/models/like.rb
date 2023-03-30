class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_posts_like_counter
    post.increment!(:likes_count)
  end
end
