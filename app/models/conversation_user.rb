class ConversationUser < ApplicationRecord
  after_create :increment_values
  after_destroy :decrement_values

  belongs_to :conversation
  belongs_to :user

  def increment_values
    Conversation.increment_counter(:member_count, self.conversation_id)
  end

  def decrement_values
    Conversation.decrement_counter(:member_count, self.conversation_id)
  end
end
