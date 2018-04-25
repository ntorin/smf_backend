class ApplicationController < ActionController::API
  #include CanCan::Ability
  include DeviseTokenAuth::Concerns::SetUserByToken
  #before_action :authenticate_user!, except: ['User.reset_daily_posts', 'User.reset_weekly_posts', 'User.reset_monthly_posts']

  #def current_ability
  #  @current_ability ||= Ability.new(current_user, params)
  #end
end
