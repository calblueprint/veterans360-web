class VeteranAbility
  include CanCan::Ability

  def initialize(veteran)
    veteran ||= Veteran.new

    can [
      :index,
    ], Veteran

    can [
      :show,
      :update,
      :destroy,
    ], Veteran, id: veteran.id

    can [
      :index,
    ], PartneringOrganization

    can [
      :index,
      :show,
    ], Resource

  end
end
