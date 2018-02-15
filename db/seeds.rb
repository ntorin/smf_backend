[Group, User, Topic, Post, Friend, Follow, GroupUser, Conversation, ConversationUser].each do |table|
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

100.times do |u|
  User.create(
      [
          {
              email: 'user' + u.to_s + '@smf.com',
              password: '313Ghioio',
              identifier: Faker::Lorem.unique.characters(1..16),
              name: Faker::Cat.breed,
              blurb: Faker::Lorem.sentence,
              birthday: Faker::Date.birthday(18, 65),

              follower_count: 0,
              following_count: 0,
              friend_count: 0,
              credits: 0,
              credit_multiplier: 0,
              total_likes: 0,
              total_dislikes: 0,
              topic_count: 0,
              post_count: 0,
              group_count: 0,
              accepted_tos: true,

              verified: Faker::Boolean.boolean
          }
      ]
  )
end

Faker::UniqueGenerator.clear

41.times do |g|

  group = Group.create(
      {
          user_id: Faker::Number.between(1, 50),
          identifier: Faker::Lorem.unique.characters(1..16),
          name: Faker::Coffee.blend_name,
          description: Faker::Lorem.sentence,
          tags: Faker::Coffee.notes,
          member_count: 0,
          topic_count: 0,
          post_count: 0,
          lat: 0,
          lng: 0
      }
  )

  GroupUser.create(
               {
                   group_id: group.id,
                   user_id: group.user_id,
                   role: 'creator'
               }
  )

  15.times do |gu|
    GroupUser.create(
        {
            group_id: group.id,
            user_id: Faker::Number.between(1, 50),
            role: Faker::Boolean.boolean(0.8) ? 'user' : Faker::Boolean.boolean(0.8) ? 'moderator' : 'admin'
        }
    )
  end

  40.times do |t|
    topic = Topic.create(
             {
                 group_id: group.id,
                 user_id: Faker::Number.between(1, 50),
                 title: Faker::Lorem.sentence,
                 topic_type: 0,
                 is_anonymous: Faker::Boolean.boolean,
                 is_pinned: false,
                 is_locked: Faker::Boolean.boolean(0.1),
                 tags: Faker::Coffee.notes,
                 post_count: 0
             }
    )
    Post.create(
        {
            group_id: group.id,
            topic_id: topic.id,
            user_id: topic.user_id,
            content: Faker::Lorem.paragraph,
            likes: 0,
            dislikes: 0,
            is_op: true,
            is_anonymous: topic.is_anonymous
        }
    )
    40.times do |p|
      Post.create(
              {
                  group_id: group.id,
                  topic_id: topic.id,
                  user_id: Faker::Number.between(1, 50),
                  content: Faker::Lorem.paragraph,
                  likes: 0,
                  dislikes: 0,
                  is_op: false,
                  is_anonymous: topic.is_anonymous
              }
      )
    end
  end
end

5000.times do |fo|
  Follow.create(
            {
                follower_id: Faker::Number.between(1, 50),
                following_id: Faker::Number.between(1, 50)
            }
  )
end

5000.times do |fr|
  friend = Friend.create(
            {
                friend_one: Faker::Number.between(1, 50),
                friend_two: Faker::Number.between(1, 50),
                is_accepted: Faker::Boolean.boolean(0.2)
            }
  )

  if friend.is_accepted
    friend_one = User.find(friend.friend_one)
    friend_two = User.find(friend.friend_two)
    conversation = Conversation.create({name: friend_one.identifier + ', ' + friend_two.identifier})
    ConversationUser.create({conversation_id: conversation.id, user_id: friend_one.id})
    ConversationUser.create({conversation_id: conversation.id, user_id: friend_two.id})
  end
end