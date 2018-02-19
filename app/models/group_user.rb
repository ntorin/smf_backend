class GroupUser < ApplicationRecord
  after_create :increment_values
  after_destroy :decrement_values
  after_update :send_notifications

  belongs_to :group
  belongs_to :user

  ROLES = %w[user moderator admin creator]
  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  def increment_values
    Group.increment_counter(:member_count, self.group_id)
    User.increment_counter(:group_count, self.user_id)

    if self.user_id == Group.find(self.group_id).user_id
      self.update(role: 'creator')
    end

    Feed.create({user_id: self.user_id, group_id: self.group_id, source_id: self.group_id, feed_type: 'group-join', deep_link: 'group/' + self.id.to_s})
  end

  def decrement_values
    Group.decrement_counter(:member_count, self.group_id)
    User.decrement_counter(:group_count, self.user_id)
  end

  def send_notifications
    if self.is_kicked_changed? && self.is_kicked
      group = Group.find(self.group_id)
      Notification.create({
                              user_id: self.user_id,
                              group_id: self.group_id,
                              source_id: self.group_id,
                              notification_type: 'group-kick',
                              description: 'You have been kicked from ' + group.identifier + '.',
                              is_seen: false,
                              deep_link: 'group/' + self.group_id.to_s
                          })
    end

    if self.is_banned_changed? && self.is_banned
      group = Group.find(self.group_id)
      Notification.create({
                              user_id: self.user_id,
                              group_id: self.group_id,
                              source_id: self.group_id,
                              notification_type: 'group-ban',
                              description: 'You have been banned from ' + group.identifier + '.',
                              is_seen: false,
                              deep_link: 'group/' + self.group_id.to_s
                          })
    end

    if self.is_banned_changed? && !self.is_banned
      group = Group.find(self.group_id)
      Notification.create({
                              user_id: self.user_id,
                              group_id: self.group_id,
                              source_id: self.group_id,
                              notification_type: 'group-unban',
                              description: 'You have been unbanned from ' + group.identifier + '.',
                              is_seen: false,
                              deep_link: 'group/' + self.group_id.to_s
                          })
    end
  end
end
