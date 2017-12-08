class Friend < ApplicationRecord
  after_create :increment_values
  after_destroy :decrement_values

  def increment_values
    User.increment_counter(:friend_count, self.friend_one)
    User.increment_counter(:friend_count, self.friend_two)
  end

  def decrement_values
    User.decrement_counter(:friend_count, self.friend_one)
    User.decrement_counter(:friend_count, self.friend_two)
  end
end
