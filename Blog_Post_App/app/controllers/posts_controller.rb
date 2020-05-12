class PostsController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
    before_action :authorize!, only: [:edit, :update, :destroy]

    def index
        @posts = Post.all.order('id')
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(params.require(:post).permit(:author, :body))
        @post.user = current_user
        if @post.save
            flash[:success] = "created a post"
            redirect_to posts_path
        else
            flash[:warning] = "couldn't create this post"
            redirect_to new_post_path
        end
    end

    def destroy
        @post = Post.find params[:id]
        @post.destroy
        redirect_to posts_path
    end

    def edit
        @post = Post.find params[:id]
    end

    def update
        @post = Post.find params[:id]
        if @post.update(params.require(:post).permit(:author, :body))
            redirect_to post_path(@post)
        else
            render :edit
        end
    end

    def show
        @post = Post.find params[:id]
    end

    private

    def authorize! 
      redirect_to posts_path, alert: 'Not Authorized' unless can?(:crud, Post)
    end

end
