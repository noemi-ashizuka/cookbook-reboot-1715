require_relative "view"
require_relative "recipe"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def add
    # Ask the view to ask the user for a name and store it
    name = @view.ask_for("name")
    # Ask the view to ask the user for a description and store it
    description = @view.ask_for("description")
    # make an instance of recipe with the name and description
    recipe = Recipe.new(name, description)
    # ask the cookbook to store our recipe
    @cookbook.create(recipe)
  end

  def list
    display_recipes
  end

  def remove
    # display recipes
    display_recipes
    # Ask the user for a number (index)
    index = @view.ask_for_index
    # ask the cookbook to remove the recipe
    @cookbook.destroy(index)
  end

  private

  def display_recipes
    # get all the recipes from the cookbook
    recipes = @cookbook.all # recipes from the cookbook
    # ask the view to display the recipes
    @view.display(recipes)
  end
end