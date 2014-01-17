class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :read, Article
    can :create, Article if user.persisted?
    can :manage, Article, user_id: user.id
  end
end
