[Feed, Group, Topic, PrivateMessage, Notification, Report, Post, TopicTag, GroupTag].each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table.table_name}")
  ActiveRecord::Base.connection.reset_pk_sequence!(table.table_name)
end

# creating the Global BBS
Group.create({creator_id: 0, handle: 'global', name: 'Global BBS', description: 'Talk about anything.', member_count: 0, topic_count: 0, post_count: 0, lat: 0, lng: 0})

# creating dummy data
30.times do |i|

  Feed.create(
      [
          {
              user_id: 0,
              feed_type: Random.rand(0..5),
              goto_id: i
          },

          {
              user_id: 1,
              feed_type: Random.rand(0..5),
              goto_id: i
          }
      ]
  )

  Group.create(
      [
          {
              creator_id: 0,
              name: Faker::Coffee.blend_name,
              handle: Faker::Lorem.word,
              description: Faker::Lorem.sentence,
              member_count: 0,
              topic_count: 0,
              post_count: 0,
              lat: 0,
              lng: 0
          },

          {
              creator_id: 1,
              name: Faker::Coffee.blend_name,
              handle: Faker::Lorem.word,
              description: Faker::Lorem.sentence,
              member_count: 0,
              topic_count: 0,
              post_count: 0,
              lat: 0,
              lng: 0
          }
      ]
  )

  Topic.create(
      [
          {
              group_id: 0,
              creator_id: 0,
              title: Faker::Lorem.sentence,
              topic_type: Random.rand(0..3),
              last_post_date: DateTime.now
          },

          {
              group_id: 1,
              creator_id: 1,
              title: Faker::Lorem.sentence,
              topic_type: Random.rand(0..3),
              last_post_date: DateTime.now
          }
      ]
  )

  PrivateMessage.create(
      [
          {
              conversation_id: 0,
              sender_id: 0,
              message: Faker::Lorem.sentence
          },

          {
              conversation_id: 0,
              sender_id: 1,
              message: Faker::Lorem.sentence
          }
      ]
  )
  Notification.create(
      [
          {
              user_id: 0,
              notification_type: Random.rand(0..5),
              description: Faker::Lorem.sentence,
              goto_id: i,
              is_seen: false
          },

          {
              user_id: 0,
              notification_type: Random.rand(0..5),
              description: Faker::Lorem.sentence,
              goto_id: i,
              is_seen: true
          }
      ]
  )
  Report.create(
      [
          {
              reporter_id: 0,
              reported_id: 1,
              reason: Faker::Lorem.word,
              comment: Faker::Lorem.sentence
          },

          {
              reporter_id: 1,
              reported_id: 0,
              reason: Faker::Lorem.word,
              comment: Faker::Lorem.sentence
          }
      ]
  )

  5.times do |j|
    Post.create(
        [
            {
                topic_id: i,
                creator_id: 0,
                content: Faker::Lorem.paragraph,
                likes: Random.rand(0..500),
                dislikes: Random.rand(0..500),
                is_op: true,
                is_anonymous: false,
            },

            {
                topic_id: i,
                creator_id: 1,
                content: Faker::Lorem.paragraph,
                likes: Random.rand(0..500),
                dislikes: Random.rand(0..500),
                is_op: false,
                is_anonymous: true,
                edit_date: DateTime.now
            }
        ]
    )
    TopicTag.create(
        [
            {
                topic_id: i,
                name: Faker::Lorem.word
            }
        ]
    )
    GroupTag.create(
        [
            {
                group_id: i,
                name: Faker::Lorem.word
            }
        ]
    )
  end
end
