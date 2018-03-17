class ResourcesController < ApplicationController
  # before_action :authenticate_veteran!
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  before_action :parse_categories, only: [:index]

  has_scope :by_category, type: :array

  # GET /resources
  # GET /resources.json
  def index
    if admin_signed_in?
      @resources = Resource.all
    else
      @resources = apply_scopes(Resource).all
      render json: @resources, each_serializer: ResourceSerializer, scope: {
        current_veteran: current_veteran
      }
    end
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  # POST /resources.json
  def create
    if admin_signed_in?
      user = Admin.find(current_admin.id)
    end
    if partnering_organization_signed_in?
      user = PartneringOrganization.find(current_partnering_organization.id)
    end
    @resource = user.resources.new(resource_params)
    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def num_upvotes
    @resource = Resource.find(params[:id])
    render :json => {:count => @resource.upvotes.count}.to_json
  end

  def get_resource_categories
    render json: Resource.resource_categories
  end

  def get_home_resources
    @resources = Resource.select('resources.*, count(upvotes.id) AS upvotes_count').joins(:upvotes).where('upvotes.created_at >= ?', Time.now - 1.day).group('resources.id').order('upvotes_count DESC')
    render json: @resources, each_serializer: ResourceSerializer, scope: {
      current_veteran: current_veteran
    }
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(
        :file_name,
        :file,
        :category,
        :description,
        :section
      )
    end

    def parse_categories
      if params.has_key?(:by_category)
        params[:by_category] = JSON.parse(params[:by_category])
      end
    end
end
