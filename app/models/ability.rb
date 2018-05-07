class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest user
    can :create, :read, :update, User, id: user.id
    if user.admin?
      can :manage, :all
    end
  end
end
