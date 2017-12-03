class PartneringOrganizationsController < ApplicationController
  before_action :set_partnering_organization, only: [:show, :edit, :update, :destroy, :approve]

  # GET /partnering_organizations
  # GET /partnering_organizations.json
  def index
    @partnering_organizations = PartneringOrganization.all
    respond_to do |format|
      format.html { render :index }
      format.json {
        render json: @partnering_organizations,
               each_serializer: PartneringOrganizationSerializer
      }
    end
  end

  # GET /partnering_organizations/1
  # GET /partnering_organizations/1.json
  def show
    puts @partnering_organization.approval_status
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

  def approve
    @partnering_organization.approval_status = true
    @partnering_organization.save
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
    def partnering_organization_params
      params.require(:partnering_organization).permit(:name, :phone_number, :website, :address, :lat, :lng, :role, :demographic, :image)
    end
end
