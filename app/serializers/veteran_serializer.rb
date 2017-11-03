class VeteranSerializer < BaseSerializer
  attributes :id,
             :first_name,
             :last_name,
             :on_connect,
             :roles,
             :email
end
