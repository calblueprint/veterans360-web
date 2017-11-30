class AdminAbility
  include CanCan::Ability

  def initialize(admin)
    admin ||= Admin.new

    can [
      :show,
      :update,
      :destroy,
    ], Admin, id: admin.id

    can [
      :index,
      :destroy,
    ], PartneringOrganization

    can [
      :index,
      :destroy,
    ], Veteran

    can :manage, Resource
  end
end
