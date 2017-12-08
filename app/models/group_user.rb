class GroupUser < ApplicationRecord
  after_create :increment_values
  after_destroy :decrement_values

  def increment_values
    Group.increment_counter(:member_count, self.group_id)
    User.increment_counter(:group_count, self.user_id)
  end

  def decrement_values
    Group.decrement_counter(:member_count, self.group_id)
    User.decrement_counter(:group_count, self.user_id)
  end
end
