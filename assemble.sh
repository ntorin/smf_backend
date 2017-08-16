rails g scaffold Feed user_id:integer feed_type:integer goto_id:integer
rails g scaffold Group user_id:integer name:string handle:string description:text members:integer posts:integer
rails g scaffold Thread user_id:integer thread_type:integer name:string
rails g scaffold Post user_id:integer thread_id:integer message:text
rails g scaffold PrivateMessage sender_id:integer recipient_id:integer message:text
rails g scaffold Notification notification_type:integer message:text goto_id:integer is_seen:boolean
rails g scaffold Report reporter_id:integer culprit_id:integer reason:string comment:text
