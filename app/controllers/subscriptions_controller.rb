class SubscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
  end
  
  # POST /veterans/1/subscriptions
  def create
    po_id = subscription_params[:partnering_organization_id]
    veteran = Veteran.find(params[:veteran_id])
    @subscription = veteran.subscriptions.build(
      partnering_organization_id: po_id
    )
    if @subscription.save
      render json: @subscription
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(
      :partnering_organization_id,
    )
  end
end
