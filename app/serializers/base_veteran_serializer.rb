class BaseVeteranSerializer < BaseSerializer
  attributes :id,
             :first_name,
             :last_name,
             :on_connect,
             :roles,
             :email,
             :lat,
             :lng, 
             :military_branch,
             :is_friend,
             :sent_friend_request
  def is_friend
    scope[:current_veteran].is_friend_of?(object)
  end

  def sent_friend_request
    scope[:current_veteran].sent_friend_request_to?(object)
  end
end
