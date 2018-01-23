class ConversationChannel < ApplicationCable::Channel
  def subscribed
     stream_from "conversation_#{params[:room]}"
  end

  def unsubscribed
  end
end
