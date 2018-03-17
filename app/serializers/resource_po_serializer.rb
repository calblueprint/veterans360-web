class ResourcePoSerializer < ActiveModel::Serializer
  attributes :num_upvotes
  def num_upvotes
    object.upvotes.count
  end
end
