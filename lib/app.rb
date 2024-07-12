require_relative 'cookbook'
require_relative 'controller'
require_relative 'router'
# require_relative 'recipe'

csv_file   = File.join(__dir__, 'recipes.csv')
cookbook   = Cookbook.new(csv_file)

# p cookbook
# pizza = Recipe.new("pizza", "extra cheese")
# cookbook.create(pizza)
# p cookbook
controller = Controller.new(cookbook)

router = Router.new(controller)

# Start the app
router.run
