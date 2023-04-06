class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :update_posts_counter

  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :title, presence: true, length: { maximum: 250 }

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  private

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
