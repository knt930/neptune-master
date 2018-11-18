class Api::V1::RecipesController < ApplicationController
  before_action :set_recipes , only: :index
  before_action :set_recipe, only: :show

  def index
    if Time.now.beginning_of_day < params[:first_launched_at]
      render json: {recipes: @recipes.order(boosted: :desc)}
    else
      render json: {recipes: @recipes}
    end
  end

  def show
    render json: {recipe: @recipe}, include: [:ingredients, :instructions]
  end

  private

  def set_recipes
    @recipes = Recipe.page(params[:page]).per(10)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
