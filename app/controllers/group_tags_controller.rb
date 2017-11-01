class GroupTagsController < ApplicationController
  before_action :set_group_tag, only: [:show, :update, :destroy]

  # GET /group_tags
  def index
    @group_tags = GroupTag.all

    render json: @group_tags
  end

  # GET /group_tags/1
  def show
    render json: @group_tag
  end

  # POST /group_tags
  def create
    @group_tag = GroupTag.new(group_tag_params)

    if @group_tag.save
      render json: @group_tag, status: :created, location: @group_tag
    else
      render json: @group_tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /group_tags/1
  def update
    if @group_tag.update(group_tag_params)
      render json: @group_tag
    else
      render json: @group_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /group_tags/1
  def destroy
    @group_tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_tag
      @group_tag = GroupTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_tag_params
      params.require(:group_tag).permit(:group_id, :name)
    end
end
