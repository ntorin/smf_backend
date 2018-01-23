class ConversationMessage < ApplicationRecord
  after_create :increment_values
  after_update :emit_update
  after_destroy :decrement_values

  belongs_to :user

  def increment_values
    Conversation.increment_counter(:message_count, self.conversation_id)
    Conversation.find(self.conversation_id).update(last_message_date: DateTime.now, last_message: self.message[0..50])

    ConversationUser.where(conversation_id: self.conversation_id).find_each do |u|
      ConversationUser.increment_counter(:unreads, u.id)
    end

    user = User.find(self.user_id)

    ActionCable.server.broadcast("conversation_#{self.conversation_id}", {message: self, name: user.name, type: 'create'})
  end

  def emit_update
    user = User.find(self.user_id)
    ActionCable.server.broadcast("conversation_#{self.conversation_id}", {message: self, name: user.name, type: 'update'})
  end

  def decrement_values
    user = User.find(self.user_id)
    Conversation.decrement_counter(:message_count, self.conversation_id)

    ActionCable.server.broadcast("conversation_#{self.conversation_id}", {message: self, name: user.name, type: 'destroy'})
  end
end