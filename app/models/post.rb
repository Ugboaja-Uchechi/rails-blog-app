class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'posts_id'
  has_many :likes, class_name: 'Like', foreign_key: 'posts_id'
  after_save :update_post_count
  def update_post_count
    author.postsCounter = 0 if author.postsCounter.nil?
    author.increment!(:postsCounter)
  end

  def self.five_recent_comments(id)
    Comment.where(posts_id: id).limit(5)
  end

  def self.all_comments(id)
    Comment.where(posts_id: id)
  end
end
