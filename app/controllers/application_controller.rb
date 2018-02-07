class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    case
    when user.is_a?(Admin)
      admins_path
    when user.is_a?(PartneringOrganization)
      partnering_organization_path(current_partnering_organization.id)
    else
      super
    end
  end

  def after_sign_out_path_for(user)
    puts "here"
    if user == :admin
      admins_path
    elsif user == :partnering_organization
      partnering_organizations_path
    else
      root_path
    end
  end
end
