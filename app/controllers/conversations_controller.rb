class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :update, :destroy]

  # GET /conversations
  def index
    @conversations = Conversation.all

    render json: @conversations
  end

  # GET /conversations/1
  def show
    render json: @conversation
  end

  # POST /conversations
  def create
    @conversation = Conversation.new(conversation_params)

    if @conversation.save
      render json: @conversation, status: :created, location: @conversation
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /conversations/1
  def update
    if @conversation.update(conversation_params)
      render json: @conversation
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /conversations/1
  def destroy
    @conversation.destroy
  end

  # POST /conversations/fetch
  # user_id:
  # sort_by:
  # page:
  # per_page:
  # query:
  def fetch
    sort = 'updated_at DESC'

    case params[:sort_by]
      when 'recent'
        sort = 'updated_at DESC'
    end

    query = '%' + params[:query].downcase + '%'
    conversation_users = ConversationUser.where(user_id: params[:user_id])

    conversation_ids = []

    conversation_users.each do |cu|
      conversation_ids.push(cu.conversation_id)
    end

    conversations = Conversation.joins(:conversation_users)
                        .where(:conversation_users => {user_id: params[:user]})
                        .order(sort)

    paginate json: conversations
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def conversation_params
      params.require(:conversation).permit(:name, :description, :is_group)
    end
end
