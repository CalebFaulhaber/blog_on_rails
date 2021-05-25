class CommentsController < ApplicationController

  before_action :authenticate_user!, except:[:index]
  before_action :find_post, only:[ :create, :destroy, :update ]
  # before_action :authorize_user!, only: [:create, :update, :destroy]

  def create 
    @post = Post.find params[:post_id]
    @comment = Comment.new comment_params
    @comment.post = @post
    @comment.user = @current_user
    if can? :crud, @comment
      if @comment.save
        redirect_to post_path(@post), notice: 'Comment Created'
      else
        p @post.errors.full_messages
        @comment = @post.comments.order(created_at: :desc)
        redirect_to :posts
      end
    else
      redirect_to :show, alert: 'Not Authorized'
    end      
  end

  def destroy
    @comment = Comment.find params[ :id ]
    if can? :crud, @comment
      @comment.destroy
      redirect_to post_path(@post), notice: 'Comment Deleted'
    else
      redirect_to :show, alert: 'Not Authorized'
    end
  end

  def edit

  end

  def update
    @comment = Comment.find params[ :id ]
    if can? :crud, @comment 
      @comment.update comment_params
      redirect_to post_path(@post), notice: 'Comment Updated'
    else
      render :show
    end
  end

  private

  def find_post
    @post = Post.find params[ :post_id ]
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user!
    unless can? :crud, @comment
      # flash[:danger] = 'Access Denied'
      redirect_to home_path, danger: 'Access Denied'
    end
  end

end
