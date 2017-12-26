class ConversationMessage < ApplicationRecord
  after_create :increment_values
  after_update :emit_update
  after_destroy :decrement_values

  has_one :user

  def increment_values
    Conversation.increment_counter(:message_count, self.conversation_id)
    Conversation.find(self.conversation_id).update(last_message_date: DateTime.now, last_message: self.message)

    ConversationUser.where(conversation_id: self.conversation_id).find_each do |u|
      ConversationUser.increment_counter(:unreads, u.id)
    end

    ActionCable.server.broadcast("conversation_#{self.conversation_id}", {message: self, type: 'create'})
  end

  def emit_update
    ActionCable.server.broadcast("conversation_#{self.conversation_id}", {message: self, type: 'update'})
  end

  def decrement_values
    Conversation.decrement_counter(:message_count, self.conversation_id)

    ActionCable.server.broadcast("conversation_#{self.conversation_id}", {message: self, type: 'destroy'})
  end
end