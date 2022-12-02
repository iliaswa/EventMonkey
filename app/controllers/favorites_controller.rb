class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]

  def index
    @favorites = Favorite.all
  end

  def show
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(strong_params)
    @favorite.user = @user
    @favorite.save! # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to favorite_path(@favorite)
  end

  def destroy
    @favorite.destroy!
    redirect_to favorites_path, status: :see_other
  end


  def add_favorites
    @event = Event.find(params[:id])
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.event = @event
    @favorite.save!
    redirect_to event_path(@event)
  end
  private

  def set_user
    @user = current_user
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def strong_params
    params.require(:favorite).permit(:name)
  end
end
