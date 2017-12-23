class GroupUser < ApplicationRecord
  after_create :increment_values
  after_destroy :decrement_values

  belongs_to :group
  belongs_to :user

  def increment_values
    Group.increment_counter(:member_count, self.group_id)
    User.increment_counter(:group_count, self.user_id)

    Feed.create({user_id: self.user_id, source_id: self.group_id, feed_type: 'group-join', deep_link: 'group/' + self.id.to_s})
  end

  def decrement_values
    Group.decrement_counter(:member_count, self.group_id)
    User.decrement_counter(:group_count, self.user_id)
  end
end
