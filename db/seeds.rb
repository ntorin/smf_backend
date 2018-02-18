[Group, User, Topic, Post, Friend, Follow, GroupUser, Conversation, ConversationUser, Feed, CreditHistory, Notification, ConversationUser, Referral, Report].each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table.table_name}")
  ActiveRecord::Base.connection.reset_pk_sequence!(table.table_name)
end

Faker::UniqueGenerator.clear

# creating the Global BBS
Group.create(
    {
        user_id: 1,
        identifier: 'global',
        name: 'Global BBS',
        description: 'Talk about anything.',
        tags: 'global',
        member_count: 0,
        topic_count: 0,
        post_count: 0,
        lat: 0,
        lng: 0
    }
)