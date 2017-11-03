class PartneringOrganizationSerializer < BaseSerializer
  attributes :id,
             :name,
             :phone_number,
             :website,
             :address,
             :latitude,
             :longitude,
             :role,
             :demographic
end
