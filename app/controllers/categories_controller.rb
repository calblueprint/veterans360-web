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

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
