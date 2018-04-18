class CategoriesController < ApplicationController
  load_and_authorize_resource

  # POST /categories
  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render json: @category }
      else
        format.html { redirect_to @category, notice: 'Category failed to create.' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/:id
  def destroy
    respond_to do |format|
      if @category.destroy
        format.html { redirect_to `/`, notice: 'Category was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to `/`, notice: 'Category failed to delete.' }
        format.json { head :no_content, status: :unprocessable_entity }
      end
    end
  end

  def index
    @categories = Category.all
    render json: @categories
  end

  def vault_categories
    @vault_categories = Category.where("section = 1").order("section")
    render json: @vault_categories
  end

  def response_categories
    @response_categories = Category.where("section = 2").order("section")
    render json: @response_categories
  end

  def get_resources_in
    resources = []
    @category = Category.find(params[:id])
    @category.partnering_organizations.each do |partner_org|
      resources += partner_org.resources
    end
    render json: resources, each_serializer: ResourceSerializer, scope: {
      current_veteran: current_veteran
    }
  end

  private
    def category_params
      params.require(:category).permit(:name, :section)
    end
end
