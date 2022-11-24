class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorite.create(post_id: params[:post_id])
    redirect_to post_path, notice: "#{favorite.post.user.name}さんの投稿をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorite.find_by(id: params[:id]).destroy
    redirect_to post_path, notice: "#{favorite.post.user.name}さんの投稿をお気に入り解除しました"
  end

end
