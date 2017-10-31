# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
=begin
30.times do |i|

  Feed.create([{user_id: 0, feed_type: Random.new(5), goto_id:i},
               {user_id: 1, feed_type: Random.new(5), goto_id:i}])
  Group.create([{user_id: 0, name: Faker::Coffee.blend_name, handle: Faker::Lorem.word, description: Faker::Lorem.sentence, members: 0, posts: 0},
                {user_id: 1, name: Faker::Coffee.blend_name, handle: Faker::Lorem.word, description: Faker::Lorem.sentence, members: 0, posts: 0}])
  Topic.create([{user_id: 0, topic_type: Random.new(3), name: Faker::Lorem.sentence},
                 {user_id: 1, topic_type: Random.new(3), name: Faker::Lorem.sentence}])
  PrivateMessage.create([{sender_id: 0, recipient_id: 1, message: Faker::Lorem.sentence},
                         {sender_id: 1, recipient_id: 0, message: Faker::Lorem.sentence}])
  Notification.create([{user_id: 0, notification_type: Random.new(5), message: Faker::Lorem.sentence, goto_id: i, is_seen:false},
                       {user_id: 1, notification_type: Random.new(5), message: Faker::Lorem.sentence, goto_id: i, is_seen:false}])
  Report.create([{reporter_id:0, culprit_id: 1, reason: Faker::Lorem.word, comment: Faker::Lorem.sentence},
                 {reporter_id:1, culprit_id: 0, reason: Faker::Lorem.word, comment: Faker::Lorem.sentence}])

  5.times do |j|
    Post.create([{user_id: 0, topic_id: i, message: Faker::Lorem.paragraph},
                 {user_id: 1, topic_id: i, message: Faker::Lorem.paragraph}])
  end
end
=end