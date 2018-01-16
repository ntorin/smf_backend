class ApplicationController < ActionController::API
  include CanCan::Ability
  include DeviseTokenAuth::Concerns::SetUserByToken

  def current_ability
    @current_ability ||= Ability.new(current_user, params)
  end
end
