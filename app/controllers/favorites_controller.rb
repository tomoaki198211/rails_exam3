class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    set_post
  end

  def destroy
    favorite = current_user.favorites.find_by(post_id: params[:post_id]).destroy
    set_post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

end
