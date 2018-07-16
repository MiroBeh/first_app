class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, to: :cru
    user ||= User.new #guest user
    can :cru , User, id: user.id
    can :read, Product, :all
    if user.admin?
      can :manage, :all
    end
  end
end
