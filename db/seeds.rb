[Group, User, Topic, Post].each do |table|
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
        member_count: 0,
        topic_count: 0,
        post_count: 0,
        lat: 0,
        lng: 0
    }
)

# sample data; 20 000 users, 2 000 groups with 1 500 users each, 500 topics per group, 800 posts per topic. 100 000 random follows, 50 000 random friends
20000.times do |u|
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

2000.times do |g|

  group = Group.create(
      {
          user_id: Faker::Number.between(0, 20001),
          identifier: Faker::Lorem.unique.characters(1..16),
          name: Faker::Coffee.blend_name,
          description: Faker::Lorem.sentence,
          member_count: 0,
          topic_count: 0,
          post_count: 0,
          lat: 0,
          lng: 0
      }
  )

  GroupUser.create(
               {
                   group_id: g,
                   user_id: group.user_id,
                   role: 'creator'
               }
  )

  1499.times do |gu|
    GroupUser.create(
        {
            group_id: g,
            user_id: Faker::Number.between(0, 20001),
            role: Faker::Boolean.boolean(0.8) ? 'user' : Faker::Boolean.boolean(0.8) ? 'moderator' : 'admin'
        }
    )
  end

  500.times do |t|
    topic = Topic.create(
             {
                 group_id: g,
                 user_id: Faker::Number.between(0, 20001),
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
            group_id: g,
            topic_id: t,
            user_id: topic.user_id,
            content: Faker::Lorem.paragraph,
            likes: 0,
            dislikes: 0,
            is_op: true,
            is_anonymous: topic.is_anonymous
        }
    )
    799.times do |p|
      Post.create(
              {
                  group_id: g,
                  topic_id: t,
                  user_id: Faker::Number.between(0, 20001),
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

100000.times do |fo|
  Follow.create(
            {
                follower_id: Faker::Number.between(0, 20001),
                following_id: Faker::Number.between(0, 20001)
            }
  )
end

50000.times do |fr|
  Friend.create(
            {
                friend_one: Faker::Number.between(0, 20001),
                friend_two: Faker::Number.between(0, 20001),
                is_accepted: Faker::Boolean.boolean(0.2)
            }
  )
end