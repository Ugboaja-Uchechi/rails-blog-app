class CommentsController < ApplicationController
    def new
      @comment = Comment.new
      reference_params
    end
  
    def create
      @comment = current_user.comments.new(comment_params)
      @comment.update_comments_counter
      reference_params
  
      if @comment.save
        flash[:success] = "Comment created successfully"
        redirect_to user_post_path(@comment.author, @comment.posts_id)
      else
        render :new
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:text)
    end
  
    def reference_params
      @comment.posts_id = params[:post_id]
      @comment.users_id = params[:user_id]
    end

end
