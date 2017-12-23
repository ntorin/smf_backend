class ApplicationController < ActionController::API
  include CanCan::Ability

  def current_ability
    @current_ability ||= Ability.new(current_user, params)
  end
end
