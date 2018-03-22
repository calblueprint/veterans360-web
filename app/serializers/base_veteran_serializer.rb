class BaseVeteranSerializer < BaseSerializer
  attributes :id,
             :first_name,
             :last_name,
             :on_connect,
             :roles,
             :email,
             :lat,
             :lng,
             :military_branch
end
