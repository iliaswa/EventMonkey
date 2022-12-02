class UsersController < ApplicationController

  def show
    @favorites_join = current_user.favorites
    @favorites = @favorites_join.map do |favorite|
      favorite.event
    end
  end

  def index
    @users = User.all
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:UsersController).permit(:first_name, :last_name, :handle, :email, :encrypted_password)
  end
end
