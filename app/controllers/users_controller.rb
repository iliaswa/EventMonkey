class UsersController < ApplicationController

  def show
  end

  def index
    @users = User.all
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:UsersController).permit(:first_name, :last_name, :email, :handle, :encrypted_password)
  end
end
