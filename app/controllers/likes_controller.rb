class LikesController < ApplicationController
  def create
    new_post = Post.find(params[:posts_id])
    new_author = User.find(params[:users_id])
    @like = Like.new(author: new_author, posts: new_post)
    @like.update_likes

    if @like.save
      flash[:success] = "Like added successfully"
      redirect_to user_post_path(current_user.id, new_post.id)
    end
  end

  private
end
