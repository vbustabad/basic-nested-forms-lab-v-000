class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(ingredients_attributes: 'first ingredient')
    @recipe.ingredients.build(ingredients_attributes: 'second ingredient')
  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to recipe_path
  end

  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
        :name,
        :quantity
      ]
    )
  end
end
