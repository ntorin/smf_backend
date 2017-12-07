class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update, :destroy]

  # GET /groups
  def index
    @groups = Group.all

    render json: @groups
  end

  # GET /groups/1
  def show
    render json: @group
  end

  # POST /groups
  def create
    @group = Group.new(group_params)

    if @group.save
      render json: @group, status: :created, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1
  def update
    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
  end

  # POST /groups/fetch
  # sort_by:
  # offset:
  # limit:
  # query:
  def fetch
    sort = 'created_at DESC'

    case params[:sort_by]
      when 'recent'
        sort = 'created_at DESC'
      else

    end

    query = '%' + params[:query].downcase + '%'

    groups = Group.where("LOWER(name) LIKE ? OR LOWER(handle) LIKE ?", query, query).order(sort).offset(params[:offset]).limit(params[:limit])

    render json: groups
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_params
      params.require(:group).permit(:creator_id, :identifier, :name, :description, :tags, :member_count, :topic_count, :post_count, :lat, :lng)
    end
end
