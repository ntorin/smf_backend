[Feed, Group, Topic, PrivateMessage, Notification, Report, Post, User].each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table.table_name}")
  ActiveRecord::Base.connection.reset_pk_sequence!(table.table_name)
end

Faker::UniqueGenerator.clear

# creating the Global BBS
Group.create(
    {
        creator_id: 0,
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

# creating sample users
50.times do |u|
  User.create(
      [
          {
              email: 'user' + u.to_s + '@smf.com',
              password: '313Ghioio',
              identifier: Faker::Lorem.unique.word,
              name: Faker::Cat.breed,
              blurb: Faker::Matz.quote,
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
