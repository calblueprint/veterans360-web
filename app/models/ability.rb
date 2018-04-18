class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(PartneringOrganization)
      can :read, Resource
      can :manage, Resource, id: user.id
      can :read, PartneringOrganization
      can :manage, PartneringOrganization, id: user.id
      can :read, Veteran
      can :manage, Category
    elsif user.is_a?(Veteran)
      can :read, Resource
      can :read, PartneringOrganization
      can :read, Veteran
      can :manage, Veteran, id: user.id
      can :read, Category
      can :manage, Category
    elsif user.is_a?(Admin)
      can :read, :all
      can :manage, :all
    end
  end
end
