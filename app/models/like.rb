class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'posts_id'

  def update_likes
    post.increment!(:likes_counter)
  end
end
