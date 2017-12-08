class Follow < ApplicationRecord
  after_create :increment_values
  after_destroy :decrement_values

  def increment_values
    User.increment_counter(:following_count, self.follower_id)
    User.increment_counter(:follower_count, self.following_id)
  end

  def decrement_values
    User.decrement_counter(:following_count, self.follower_id)
    User.decrement_counter(:follower_count, self.following_id)
  end
end
