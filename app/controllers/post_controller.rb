class PostController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = Post.where(author_id: params[:user_id]).all
    @comments = Comment.new
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = Comment.where(post_id: params[:id]).where(author_id: params[:user_id]).all
  end

  def new
    @post = current_user.posts.new
    @current_user = current_user
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.commentsCounter = 1
    @post.likesCounter = 1
    @post.update_post_count

    respond_to do |format|
      format.html do
    if @post.save
          # Post.count_post(params[:user_id])
          flash[:success] = 'Post created successfully'
          redirect_to user_post_path(current_user.id, @post.id)
        else
          flash.now[:error] = 'Error: Post could not be created'
          render :new, locals: { post: @post }
        end
      end
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
