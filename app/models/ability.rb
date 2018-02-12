class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new
    if user.is_a?(PartneringOrganization)
      user ||= PartneringOrganization.new
      can :read, PartneringOrganization
      can :manage, PartneringOrganization
    elsif user.is_a?(Veteran)
      user ||= Veteran.new
      can :read, Veteran
      can :manage, Veteran
    elsif user.is_a?(Admin)
      user ||= Admin.new
      can :read, :all
      can :manage, :all
    # else
    #   can :read, PartneringOrganization =>
    end
  end
end
