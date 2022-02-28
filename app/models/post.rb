class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'posts_id'
  has_many :likes, class_name: 'Like', foreign_key: 'posts_id'

  validates :title, length: { maximum: 250 }, presence: true
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_post_count
    User.increment!(:postsCounter)
  end

  def five_recent_comments
    comments.order('created_at DESC').limit(5)
  end

  def all_comments(id)
    Comment.where(posts_id: id)
  end
end
