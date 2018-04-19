class VeteranSecretFieldsSerializer < BaseVeteranSerializer
  attributes :address,
             :phone_number

  def roles
    object.readable_roles
  end
end
