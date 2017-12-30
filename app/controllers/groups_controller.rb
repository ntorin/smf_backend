class GroupsController < ApplicationController
  before_action :authenticate_user!
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
    if !Group.where("LOWER(identifier) = ?", params[:group][:identifier].downcase).exists?
      @group = Group.new(group_params)

      if @group.save
        render json: @group, status: :created, location: @group
      else
        render json: @group.errors, status: :unprocessable_entity
      end
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
  # page:
  # per_page:
  # query:
  def fetch
    sort = 'created_at DESC'

    case params[:sort_by]
      when 'recent'
        sort = 'created_at DESC'
      else

    end

    query = '%' + params[:query].downcase + '%'

    groups = Group.where("LOWER(name) LIKE ? OR LOWER(identifier) LIKE ?", query, query)
                 .order(sort)

    paginate json: groups
  end

  # POST /groups/validate_identifier
  def validate_identifier
    if Group.where("LOWER(identifier) = ?", params[:identifier].downcase).exists?
      render json: { message: 'Identifier is already taken.', valid: false }
    else
      render json: { message: 'Identifier is available.', valid: true }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_params
      params.require(:group).permit(:user_id, :identifier, :name, :description, :group_type, :tags, :member_count, :topic_count, :post_count, :lat, :lng)
    end
end
