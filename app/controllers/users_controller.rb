class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]
  #load_and_authorize_resource

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      ActionCable.server.broadcast("profile_#{@user.id}", {user: @user, action: 'profile_update'})
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    # @user.destroy
  end

  # POST /users/fetch
  # identifier:
  # name:
  # sort_by:
  # page:
  # per_page:
  def fetch
    sort = 'created_at DESC'

    case params[:sort_by]
      when 'recent'
        sort = 'created_at DESC'
      when 'popular'
        sort = 'post_count DESC'
      else

    end

    identifier = '%' + params[:identifier] + '%'
    name = '%' + params[:name] + '%'

    users = User.where("LOWER(identifier) LIKE ? OR LOWER(name) LIKE ?", identifier, name)
                .order(sort)

    paginate json: users
  end

  # POST /users/validate_identifier
  # identifier
  def validate_identifier
    if params[:identifier].match(/\A[a-zA-Z0-9_]{1,16}\z/)
    if User.where("LOWER(identifier) = ?", params[:identifier].downcase).exists?
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
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit( :email, :identifier, :name, :blurb, :birthday, :accepted_tos )
    end
end
