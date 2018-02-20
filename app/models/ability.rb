class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(PartneringOrganization)
      can :read, Resource
      can :manage, Resource, user_id: user.id 
      can :read, PartneringOrganization
      can :manage, PartneringOrganization
      can :read, Veteran
    elsif user.is_a?(Veteran)
      can :read, Resource
      can :read, PartneringOrganization
      can :read, Veteran
      can :manage, Veteran
    elsif user.is_a?(Admin)
      can :read, :all
      can :manage, :all
    end
  end
end
