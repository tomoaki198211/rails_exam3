class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    set_post
  end

  def create

  end

  def edit
    set_post
  end

  def update

  end

  def destroy
    set_post

  end

  def confirm

  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end

end
