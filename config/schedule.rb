every 1.hour do
  runner 'User.reset_daily_posts'
end

every 1.day do
  runner 'User.reset_daily_posts'
end

every 1.week do
  runner 'User.reset_weekly_posts'
end

every 1.month do
  runner 'User.reset_monthly_posts'
end