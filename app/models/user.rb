class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :confirmable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'users_id'
  has_many :likes, foreign_key: 'author_id'
  attribute :posts_counter, :integer, default: 0
  validates :name, presence: true, length: { maximum: 50 }
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
