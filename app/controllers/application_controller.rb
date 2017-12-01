class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    case
    when user.is_a?(Admin)
      admin_path(current_admin.id)
    when user.is_a?(PartneringOrganization)
      partnering_organization_path(current_partnering_organization.id)
    else
      super
    end
  end
end
