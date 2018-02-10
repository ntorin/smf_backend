class ConversationMessage < ApplicationRecord
  after_create :increment_values
  after_update :emit_update
  after_destroy :decrement_values

  belongs_to :user

  def increment_values
    Conversation.increment_counter(:message_count, self.conversation_id)
    conversation = Conversation.find(self.conversation_id)
    conversation.update(last_message_date: DateTime.now, last_message: self.message[0..50])

    user = User.find(self.user_id)

    ConversationUser.where(conversation_id: self.conversation_id).find_each do |cu|
      ConversationUser.increment_counter(:unreads, cu.id)
      if !cu.is_muted
        ActionCable.server.broadcast("conversation_uid_#{cu.user_id}", {conversation: conversation, name: user.name, action: 'conversation_message_after_create'})
      end
    end


    ActionCable.server.broadcast("conversation_#{self.conversation_id}", {message: self, name: user.name, action: 'conversation_message_after_create'})
  end

  def emit_update
    user = User.find(self.user_id)
    ActionCable.server.broadcast("conversation_#{self.conversation_id}", {message: self, name: user.name, action: 'conversation_message_after_update'})
  end

  def decrement_values
    user = User.find(self.user_id)
    Conversation.decrement_counter(:message_count, self.conversation_id)

    ActionCable.server.broadcast("conversation_#{self.conversation_id}", {message: self, name: user.name, action: 'conversation_message_after_destroy'})
  end
end