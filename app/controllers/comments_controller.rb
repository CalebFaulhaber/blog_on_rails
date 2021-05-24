class CommentsController < ApplicationController

  before_action :authenticate_user!, except:[:index]
  before_action :find_post, only:[ :create, :destroy, :update ]
  before_action :authorize_user!, only: [:destroy]

  def create 
    @post = Post.find params[:post_id]
    @comment = Comment.new comment_params
    @comment.post = @post
    @comment.user = @current_user
    
    if @comment.save
      redirect_to post_path(@post, @comment), notice: 'Comment Created'
    else
      @comment = @post.comments.order(created_at: :desc)
      render '/posts/show'
    end
  end

  def destroy
    @comment = Comment.find params[ :id ]
    @comment.destroy
    redirect_to post_path(@post, @comment), notice: 'Comment Deleted'
  end

  def update
    @comment = Comment.find params[ :id ]

    if @comment.update comment_params
      redirect_to post_path(@post, @comment)
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
      flash[:danger] = 'Access Denied'
      redirect_to home_path
    end
  end

end
