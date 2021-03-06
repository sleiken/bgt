class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favorite = Favorite.new(user_id: current_user.id, game_id: params[:user_id])
    @favorite.save
    redirect_to game_path(params[:user_id])
  end

  def destroy
    favorite = Favorite.find_by(user_id:params[:user_id],game_id: params[:id])
    delete_fav = favorite.destroy
    if request.xhr?
      render json: delete_fav.game.id
    else
      redirect_to user_path(current_user)
    end
  end
end
