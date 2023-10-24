class FavoritesController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def create
    if @place.user_id != current_user.id
      @favorite = Favorite.create(user_id: current_user.id, place_id: @place.id)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, place_id: @place.id)
    @favorite.destroy
  end

  private

  def set_post
    @place = Place.find(params[:place_id])
  end
end
