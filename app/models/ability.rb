class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role
      when 'user'
      when 'moderator'
      when 'admin'
    end

    if params[:group_id].exists?
      group_user = GroupUser.where(group_id: params[:group_id], user_id: user.id)

      if params[:post][:user_id] == user.id # if the post creator is the same as the user sending it, allow
        can :create, Post
        can :update, Post
      end

      case group_user.role
        when 'moderator'
          can :delete, Post
        when 'admin', 'creator'
          can :update, GroupUser
      end
    end

  end
end
