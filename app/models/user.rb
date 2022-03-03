class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'users_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'posts_id'
  has_many :likes, class_name: 'Like', foreign_key: 'posts_id'

  validates :name, presence: true
  validates :postsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_recent_posts
    Post.where(users_id: id).limit(3)
  end

  def all_posts
    posts.order(created_at: :desc)
  end
end
