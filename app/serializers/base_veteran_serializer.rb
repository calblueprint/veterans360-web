class BaseVeteranSerializer < BaseSerializer
  attributes :id,
             :first_name,
             :last_name,
             :on_connect,
             :roles,
             :email,
             :lat,
             :lng,
             :address,
             :phone_number,
             :description,
             :military_branch
end
