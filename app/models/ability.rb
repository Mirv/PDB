class Ability
  include CanCan::Ability

  def initialize(user)

    alias_action :update, :edit, :show, :to => :modify

    user ||= User.new
    if user.role == "admin"
      can :manage, :all
    elsif user.role == "normal"
      can :show, :all
      can :index, :all
      can :edit, Player do |player|
        user.player_id == player.id
      end
      can :create, Player
      can :modify, User do |param_user|
        user.id == param_user.id
      end
    else
      cannot :manage, :all
      can :modify, User do |param_user|
        user.id == param_user.id
      end
      can :manage, Player do |player|
        user.player_id == player.id
      end
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

  end
end
