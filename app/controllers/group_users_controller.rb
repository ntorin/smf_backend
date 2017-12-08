class GroupUsersController < ApplicationController
  before_action :set_group_user, only: [:show, :update, :destroy]

  # GET /group_users
  def index
    @group_users = GroupUser.all

    render json: @group_users
  end

  # GET /group_users/1
  def show
    render json: @group_user
  end

  # POST /group_users
  def create
    if !GroupUser.exists?(group_id: params[:group_user][:group_id], user_id: params[:group_user][:user_id])
      @group_user = GroupUser.new(group_user_params)

      if @group_user.save
        render json: @group_user, status: :created, location: @group_user
      else
        render json: @group_user.errors, status: :unprocessable_entity
      end
    end

  end

  # PATCH/PUT /group_users/1
  def update
    if @group_user.update(group_user_params)
      render json: @group_user
    else
      render json: @group_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /group_users/1
  def destroy
    @group_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_user
      @group_user = GroupUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_user_params
      params.require(:group_user).permit(:group_id, :user_id)
    end
end
