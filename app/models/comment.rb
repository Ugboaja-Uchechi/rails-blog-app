class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'posts_id'
  after_save :update_comments_counter
  def update_comments_counter
    post.increment!(:commentsCounter)
  end
end
