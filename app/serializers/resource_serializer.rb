class ResourceSerializer < BaseSerializer
  belongs_to :owner
  attributes :id,
             :file_name,
             :file,
             :category,
             :description,
             :updated_at,
             :owner_id,
             :veteran_has_upvoted

  def veteran_has_upvoted
    object.upvoted_by?(scope[:current_veteran])
  end
end
