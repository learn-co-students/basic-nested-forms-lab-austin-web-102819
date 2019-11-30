class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    # Create an empty object in which to store data
    @recipe = Recipe.new
    # Create a recipe with ingredients named "first ingredient"/"second ingredient"
    # I assume this is so that we can display the text in the form.
    @recipe.ingredients.build(name: "First Ingredient")
    @recipe.ingredients.build(name: "Second Ingredient")
   
  end

  def create

    @recipe= Recipe.create(recipe_params)
   
    redirect_to @recipe
  end

  private
  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [ :name, :quantity ]
    )
  end
end
