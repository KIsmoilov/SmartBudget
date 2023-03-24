class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user.present?

    can :manage, Group, user_id: user.id
    can :manage, Operation, user_id: user.id
    can :manage, User

    return unless user.admin?

    can :manage, :all
  end
end
