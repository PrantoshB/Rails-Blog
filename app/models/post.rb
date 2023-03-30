class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :comments_count, numericality: { greater_than_or_equal_to: 0 , only_integer: true }
  validates :likes_count, numericality: { greater_than_or_equal_to: 0 , only_integer: true }
  validates :title, presence: true, length: { maximum: 100 }

  def update_posts_counter
    author.increment!(:posts_count)
  end

  after_save :update_post_counter

  private

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
