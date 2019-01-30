class ApplicationController < ActionController::Base
  # Include some session helper methods on veteran: 
  # https://devise-token-auth.gitbook.io/devise-token-auth/usage/controller_methods
  include DeviseTokenAuth::Concerns::SetUserByToken
  skip_before_action :verify_authenticity_token, raise: false

  # def current_ability
  #   if admin_signed_in?
  #     @current_ability ||= Ability.new(current_admin)
  #   elsif partnering_organization_signed_in?
  #     @current_ability ||= Ability.new(current_partnering_organization)
  #   else
  #     @current_ability ||= Ability.new(current_veteran)
  #   end
  # end

  rescue_from CanCan::AccessDenied do
    redirect_to '/partnering_organizations/sign_in'
  end

  def after_sign_in_path_for(user)
    case
    when user.is_a?(Admin)
      admins_path
    when user.is_a?(PartneringOrganization)
      partnering_organizations_path
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
