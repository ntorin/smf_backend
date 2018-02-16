class ConversationUsersController < ApplicationController
  before_action :set_conversation_user, only: [:show, :update, :destroy]

  # GET /conversation_users
  def index
    @conversation_users = ConversationUser.all

    render json: @conversation_users
  end

  # GET /conversation_users/1
  def show
    render json: @conversation_user
  end

  # POST /conversation_users
  def create
    @conversation_user = ConversationUser.new(conversation_user_params)

    if @conversation_user.save
      render json: @conversation_user, status: :created, location: @conversation_user
    else
      render json: @conversation_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /conversation_users/1
  def update
    if @conversation_user.update(conversation_user_params)
      render json: @conversation_user
    else
      render json: @conversation_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /conversation_users/1
  def destroy
    @conversation_user.destroy
  end

  # POST /conversation_users/fetch
  # conversation_id
  # page
  # per_page
  def fetch
    conversation_users = paginate ConversationUser.where(conversation_id: params[:conversation_id])

    render json: conversation_users.to_json(:include => :user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation_user
      @conversation_user = ConversationUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def conversation_user_params
      params.require(:conversation_user).permit(:conversation_id, :user_id, :is_admin, :is_muted)
    end
end
