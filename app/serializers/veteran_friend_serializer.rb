class VeteranFriendSerializer < BaseVeteranSerializer
  attribute :is_friend

  def roles
    object.readable_roles
  end

  def is_friend
    scope[:current_veteran].is_friend_of?(object)
  end
end
