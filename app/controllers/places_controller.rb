class PlacesController < ApplicationController
  before_action :set_place, only: %i(show edit update destroy)
  before_action :authenticate_user!, except: %i(index show)
  before_action :contributor, only: %i(edit update destroy)

  def index
    @search = Place.ransack(params[:q])
    @places_to_js = @search.result.includes([:schoolgrades, :favorites])
    if params[:q] && params[:q][:s] == 'favorite_count desc'
      @places = @places_to_js.sort_by_favorite_count('desc').page(params[:page])
    elsif params[:q] && params[:q][:s] == 'favorite_count asc'
      @places = @places_to_js.sort_by_favorite_count('asc').page(params[:page])
    else
      @places = @places_to_js.page(params[:page])
    end
    gon.places = @places_to_js.handover_to_js
  end

  def show
    gon.latitude = @place.latitude
    gon.longitude = @place.longitude
  end

  def new
    @place = Place.new
  end

  def edit
    gon.latitude = @place.latitude
    gon.longitude = @place.longitude
  end

  def create
    @place = Place.new(place_params)
    respond_to do |format|
      if @place.save
        format.html { redirect_to root_path, notice: "場所の登録が完了しました。" }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to place_url(@place), notice: "登録している場所の更新が完了しました。" }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "登録していた場所を削除しました。", status: :see_other }
      format.json { head :no_content }
    end
  end

  def own
    @places = current_user.places.order(:created_at)
  end

  def favorited
    places = Favorite.where(user_id: current_user.id).pluck(:place_id)
    @places = Place.find(places)
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :address, :latitude, :longitude, :description, :image, :user_id, :toilet, :vendingmachine, schoolgrade_ids: [])
  end

  def contributor
    @place = Place.find(params[:id])
    unless @place.user_id == current_user.id
      redirect_to root_path
    end
  end
end
