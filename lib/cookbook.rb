require "csv"

class Cookbook
  # attr_reader :recipes
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def create(recipe)
    @recipes << recipe
    # p @recipes
    save_csv
  end

  def destroy(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def load_csv
    # Read from the csv file
    CSV.foreach(@csv_file, headers: :first_row) do |row|
      # p row
      # use the data from the csv file to make instances of recipes
      # add the recipes from the csv to the array @recipes
      @recipes << Recipe.new(row["name"], row["description"])
    end
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ["name", "description"]
      # iterate over the recipes array
      @recipes.each do |recipe|
        # change each instance into an array of strings
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
