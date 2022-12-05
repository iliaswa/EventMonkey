class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create, :show, :index]

  def index
    @events = []
    @favorites = @user.favorites
    @favorites.each do |favorite|
      @events << favorite.event
    end
  end

  def show
    @events = []
    @favorites = @user.favorites
    @favorites.each do |favorite|
      @events << (favorite.event)
    end
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
