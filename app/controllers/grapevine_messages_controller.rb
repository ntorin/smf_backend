class GrapevineMessagesController < ApplicationController
  before_action :set_grapevine_message, only: [:show, :update, :destroy]

  # GET /grapevine_messages
  def index
    @grapevine_messages = GrapevineMessage.all

    render json: @grapevine_messages
  end

  # GET /grapevine_messages/1
  def show
    render json: @grapevine_message
  end

  # POST /grapevine_messages
  def create
    @grapevine_message = GrapevineMessage.new(grapevine_message_params)

    if @grapevine_message.save
      render json: @grapevine_message, status: :created, location: @grapevine_message
    else
      render json: @grapevine_message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /grapevine_messages/1
  def update
    if @grapevine_message.update(grapevine_message_params)
      render json: @grapevine_message
    else
      render json: @grapevine_message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /grapevine_messages/1
  def destroy
    @grapevine_message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grapevine_message
      @grapevine_message = GrapevineMessage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def grapevine_message_params
      params.require(:grapevine_message).permit(:user_id, :name, :group_id, :message, :is_anonymous)
    end
end
