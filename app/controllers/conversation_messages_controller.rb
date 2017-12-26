class ConversationMessagesController < ApplicationController
  before_action :set_conversation_message, only: [:show, :update, :destroy]

  # GET /conversation_messages
  def index
    @conversation_messages = ConversationMessage.all

    render json: @conversation_messages
  end

  # GET /conversation_messages/1
  def show
    render json: @conversation_message
  end

  # POST /conversation_messages
  def create
    @conversation_message = ConversationMessage.new(conversation_message_params)

    if @conversation_message.save
      render json: @conversation_message, status: :created, location: @conversation_message
    else
      render json: @conversation_message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /conversation_messages/1
  def update
    if @conversation_message.update(conversation_message_params)
      render json: @conversation_message
    else
      render json: @conversation_message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /conversation_messages/1
  def destroy
    @conversation_message.destroy
  end

  # POST /conversation_messages/fetch
  # conversation_id
  # page
  # per_page
  def fetch
    messages = paginate ConversationMessage.where(conversation_id: params[:conversation_id])
                   .order('created_at DESC')
    render json: messages.to_json(:include => :user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation_message
      @conversation_message = ConversationMessage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def conversation_message_params
      params.require(:conversation_message).permit(:conversation_id, :user_id, :message)
    end
end
