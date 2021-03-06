class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update, :destroy]
  #load_and_authorize_resource


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

    q = '%' + params[:query].downcase + '%'

    groups = Group.where("LOWER(name) LIKE ? OR LOWER(identifier) LIKE ? OR lower(tags) LIKE ?", q, q, q)
                 .order(sort)

    paginate json: groups
  end

  # POST /groups/my_groups
  # user_id:
  # page:
  def my_groups
    groups = Group.joins(:group_users).where(:group_users => {user_id: params[:user_id]})

    paginate json: groups
  end

  # POST /groups/validate_identifier
  def validate_identifier

    if params[:identifier].match(/\A[a-zA-Z0-9_]{1,16}\z/)
      if Group.where("LOWER(identifier) = ?", params[:identifier].downcase).exists?
        render json: { message: 'Identifier is already taken.', valid: false }
      else
      render json: { message: 'Identifier is available.', valid: true }
      end
    else
      render json: { message: 'Identifier can only contain letters, numbers, and underscores between (1-16 characters)', valid: false}
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
