class LikesController < ApplicationController

  def create
    like = current_user.likes.create(post_id: params[:post_id])
    set_post
  end

  def destroy
    like = current_user.likes.find_by(post_id: params[:post_id]).destroy
    set_post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

end
