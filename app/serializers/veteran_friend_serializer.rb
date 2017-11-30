class VeteranFriendSerializer < BaseVeteranSerializer
  attribute :is_friend
  attribute :sent_friend_request

  def roles
    object.readable_roles
  end

  def is_friend
    scope[:current_veteran].is_friend_of?(object)
  end

  def sent_friend_request
    scope[:current_veteran].sent_friend_request_to?(object)
  end
end
