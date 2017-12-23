class Conversation < ApplicationRecord
  has_many :users, :through => :conversation_users
  has_many :conversation_messages
end
