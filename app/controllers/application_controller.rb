class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_ability
    if admin_signed_in?
      @current_ability ||= Ability.new(current_admin)
    elsif partnering_organization_signed_in?
      @current_ability ||= Ability.new(current_partnering_organization)
    else
      @current_ability ||= Ability.new(current_veteran)
    end
  end

  rescue_from CanCan::AccessDenied do
    redirect_to '/partnering_organizations/sign_in'
  end

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
    if user == :admin
      admins_path
    elsif user == :partnering_organization
      partnering_organizations_path
    else
      root_path
    end
  end
end
