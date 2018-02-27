class PartneringOrganizationsController < ApplicationController
<<<<<<< HEAD
  before_action :set_partnering_organization, only: [:show, :edit, :update, :destroy, :approve, :subscriptions]
  before_action :authenticate!
=======
  load_and_authorize_resource
  before_action :set_partnering_organization, only: [:show, :edit, :update, :destroy, :approve, :subscriptions]
>>>>>>> 0623dcf7bcb2173d2e5918a7da9e10ebaded5a07

  # GET /partnering_organizations
  # GET /partnering_organizations.json
  def index
    @partnering_organizations = PartneringOrganization.all
    serializer = veteran_signed_in? ? PartneringOrganizationSubscriptionsSerializer : PartneringOrganizationSerializer
    respond_to do |format|
      format.html { render :index }
      format.json {
        render json: @partnering_organizations,
               each_serializer: serializer,
               scope: { current_veteran: current_veteran }
      }
    end
  end

 #GET /partnering_organization/subscriptions
<<<<<<< HEAD
 # def subscriptions
 #   @subscribers = @partnering_organization.subscribers
 #
 # end
=======
 def subscriptions
   @subscribers = @partnering_organization.subscribers

 end
>>>>>>> 0623dcf7bcb2173d2e5918a7da9e10ebaded5a07

  # GET /partnering_organizations/1
  # GET /partnering_organizations/1.json
  def show
  end

  # GET /partnering_organizations/new
  def new
    @partnering_organization = PartneringOrganization.new
  end

  # GET /partnering_organizations/1/edit
  def edit
  end

  # POST /partnering_organizations
  # POST /partnering_organizations.json
  def create
    @partnering_organization = PartneringOrganization.new(partnering_organization_params)

    respond_to do |format|
      if @partnering_organization.save
        format.html { redirect_to @partnering_organization, notice: 'Partnering organization was successfully created.' }
        format.json { render :show, status: :created, location: @partnering_organization }
      else
        format.html { render :new }
        format.json { render json: @partnering_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partnering_organizations/1
  # PATCH/PUT /partnering_organizations/1.json
  def update
    respond_to do |format|
      if @partnering_organization.update(partnering_organization_params)
        format.html { redirect_to @partnering_organization, notice: 'Partnering organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @partnering_organization }
      else
        format.html { render :edit }
        format.json { render json: @partnering_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partnering_organizations/1
  # DELETE /partnering_organizations/1.json
  def destroy
    @partnering_organization.destroy
    respond_to do |format|
      format.html { redirect_to partnering_organizations_url, notice: 'Partnering organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partnering_organization
      @partnering_organization = PartneringOrganization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # I think if we want to make this secure, we can't have approval status here and should have approve in the admin controller (ask ken)
    def partnering_organization_params
      params.require(:partnering_organization).permit(:name, :phone_number, :website, :address, :lat, :lng, :role, :demographic, :image, :approval_status)
    end
  end

  def generate_new_password_email
   partnering_organization = PartneringOrganization.find(params[:user_id])
   partnering_organization.send_reset_password_instructions flash[:notice] = 'Reset password instructions have been sent to #{user.email}.'
   redirect_to admin_user_path(partnering_organization)
  end
