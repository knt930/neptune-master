class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.instructions.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end

  end

  private

    def recipe_params
      params.require(:recipe).permit(:title, :video_url, :thumbnail_url, :servings, :salt, :calorie, :introduction,
                                     ingredients_attributes: [:id, :sort_order, :name, :quantity_and_unit, :_destroy],
                                      instructions_attributes: [:id, :sort_order, :body, :_destroy])
    end
end
