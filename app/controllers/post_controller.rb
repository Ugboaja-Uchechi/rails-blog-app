class PostController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    # @user_posts = Post.where(author_id: params[:user_id]).all
    @posts = @user.posts.includes(:comments)
    @comments = Comment.new
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    # @comments = Comment.where(post_id: params[:id]).where(author_id: params[:user_id]).all
    @comments = Comment.where(post_id: params[:id]).where(author_id: params[:user_id])
  end

  def new
    @post = Post.new
    @current_user = current_user
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.commentsCounter = 0
    @post.likesCounter = 0

    if @post.save
      p @post
      flash[:notice] = 'New Post created'
      redirect_to user_path(@post.author)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def reference_params
    @post.author_id = params[:user_id]
  end
end
