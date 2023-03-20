class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Group

    return unless user.present?

    can :manage, Group, user_id: user.id
    can :manage, AccountRecord, author_id: user.id
    can :manage, AccountRecordGroup

    return unless user.admin?

    can :manage, :all
  end
end
