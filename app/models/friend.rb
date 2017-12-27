class Friend < ApplicationRecord
  after_create :increment_values
  after_destroy :decrement_values

  belongs_to :user
  belongs_to :friend, class_name: 'User', :foreign_key => 'friend_two'

  def increment_values
    User.increment_counter(:friend_count, self.friend_one)
    User.increment_counter(:friend_count, self.friend_two)
  end

  def decrement_values
    User.decrement_counter(:friend_count, self.friend_one)
    User.decrement_counter(:friend_count, self.friend_two)
  end

  def as_json(options = {})
    h = super(options)
    if 16 == self.friend_one
      h[:friend] = User.find(self.friend_two)
    else
      h[:friend] = User.find(self.friend_one)
    end

    return h
  end
end
