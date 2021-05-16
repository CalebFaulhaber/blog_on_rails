class CommentsController < ApplicationController

    before_action :find_post, only:[ :create, :destroy, :update ]

    def create 
        @comment = Comment.new comment_params
        @comment.post = @post
        
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

end
