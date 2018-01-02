class PartneringOrganizationSubscriptionsSerializer < PartneringOrganizationSerializer
  attribute :is_subscribed_to

  # Tells whether the current veteran is subscribed to this PO
  def is_subscribed_to
    scope[:current_veteran].is_subscribed_to?(object)
  end
end
