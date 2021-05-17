class PostsController < ApplicationController

    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all.order ('updated_at Desc')
    end

    def new
        @post = Post.new
    end

    def create

        @post = Post.new post_params

        if @post.save
            flash[:notice] = 'Post created successfully!'
            redirect_to posts_path
        else
            p @post.errors.full_messages
            render :new
        end
    
    end

    def show
        @comment = Comment.new
        @comments = @post.comments.order(created_at: :desc)
    end

    def edit

    end

    def update

        if @post.update post_params
            redirect_to post_path(@post)
        else
            render :show
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path
    end


    private

    def post_params
        params.require(:post).permit(:title, :body)
    end

    def find_post
        @post = Post.find params[:id]
    end



end
