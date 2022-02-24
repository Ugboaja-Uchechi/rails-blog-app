class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'posts_id'

  def self.update_comments_counter(id)
    post= Post.find(id)
    post.commentsCounter = Comment.where(posts_id: id).count
    post.save
  end
end
