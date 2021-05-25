class PostsController < ApplicationController

  before_action :authenticate_user!, except:[:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  # before_action :authorize_user!, only: [:destroy]

  def index
    @posts = Post.all.order ('updated_at Desc')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user = current_user

    if can? :crud, @post
      if @post.save
        redirect_to posts_path, notice: 'Post created successfully!'
      else
        p @post.errors.full_messages
        render :new
      end
    else
      redirect_to home_path, notice: 'Must be signed in & owner of post to edit'
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
  end

  def edit

  end

  def update
    if can? :crud, @post
      @post.update post_params
      redirect_to post_path(@post)
    else
      redirect_to home_path, notice: 'Must be signed in & owner of post to edit'
    end
  end

  def destroy
    if can? :crud, @post
      @post.destroy
      redirect_to posts_path
    else
      redirect_to home_path, notice: 'Must be signed in & owner of post to edit'
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find params[:id]
  end

  # def authenticate_user!
  #   redirect_to home_path, alert: 'Not Authorized' unless can?(:crud, Post)
  # end

end
