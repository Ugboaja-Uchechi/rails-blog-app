class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(author: params[:users_id], posts_id: params[:posts_id])

    if @like.save
      redirect_to user_post_path(@like.author_id, @like.posts_id)
    end
  end
end
