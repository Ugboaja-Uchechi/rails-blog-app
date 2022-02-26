class LikesController < ApplicationController
  def create
    new_post = Post.find(params[:posts_id])
    new_author = User.find(params[:users_id])
    @like = Like.new(author: new_author, posts: new_post)

    if @like.save
      redirect_to user_post_comments_path(@comment.author, @comment.posts_id)
    end
  end
end
