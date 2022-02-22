class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "users_id"
  has_many :comments, class_name: "Comment", foreign_key: "posts_id"
  has_many :likes, class_name: "Like", foreign_key: "posts_id"
  # def update_post_count
  #   users.increment!(:posts_counter)
  # end

  # def five_recent_comments
  #   comments.order(created_at: :desc).limit(5)
  # end
end