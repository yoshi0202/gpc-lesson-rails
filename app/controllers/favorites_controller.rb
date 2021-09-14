class FavoritesController < ApplicationController
  def create
    @favorites = Favorite.new(
      post_id: params[:post_id]
    )
    @favorites.save
    redirect_to post_path(params[:post_id])
  end
end
