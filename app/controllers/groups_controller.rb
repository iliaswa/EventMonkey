class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(strong_params)
    @group.user = @user
    @group.save! # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to group_path(@group)
  end

  def destroy
    @group.destroy!
    redirect_to groups_path, status: :see_other
  end

  private

  def set_user
    @user = current_user
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def strong_params
    params.require(:group).permit(:name)
  end
end
