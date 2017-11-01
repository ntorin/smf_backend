rails g migration AddStatsToUser handle:string name:string birthday:date follower_count:integer following_count:integer friend_count:integer credits:integer credit_multiplier:integer total_likes:integer total_dislikes:integer topic_count:integer post_count:integer group_count:integer accepted_tos:boolean
rails g scaffold CreditHistory user_id:integer transaction:integer description:text
rails g scaffold Friend friend_one:integer friend_two:integer
rails g scaffold Follow following_id:integer follower_id:integer
rails g scaffold Block blocker_id:integer blocked_id:integer
rails g scaffold PrivateMessage conversation_id:integer sender_id:integer message:text
rails g scaffold Conversation name:string description:text is_group:boolean
rails g scaffold ConversationUser conversation_id:integer user_id:integer is_admin:boolean
rails g scaffold Feed user_id:integer feed_type:integer goto_id:integer
rails g scaffold Group creator_id:integer handle:string name:string description:text member_count:integer topic_count:integer post_count:integer lat:decimal lng:decimal
rails g scaffold GroupTag group_id:integer name:string
rails g scaffold Topic group_id:integer creator_id:integer title:string topic_type:integer last_post_date:datetime
rails g scaffold TopicTag topic_id:integer name:string
rails g scaffold Post topic_id:integer creator_id:integer content:text is_anonymous:boolean edit_date:datetime
rails g scaffold Notification user_id:integer notification_type:integer description:text is_seen:boolean goto_id:integer
rails g scaffold Report reporter_id:integer reported_id:integer reason:string comment:text
