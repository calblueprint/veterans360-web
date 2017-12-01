class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    case
    when resource.is_a?(Admin)
      "/admins/#{current_admin.id}"
    when resource.is_a?(PartneringOrganization)
      partnering_organization_path
    else
      super
    end
  end
end
