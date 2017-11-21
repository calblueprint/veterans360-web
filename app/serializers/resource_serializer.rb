class ResourceSerializer < BaseSerializer
  belongs_to :owner
  attributes :id,
             :file_name,
             :file,
             :category,
             :description,
             :updated_at,
             :owner_id
end
