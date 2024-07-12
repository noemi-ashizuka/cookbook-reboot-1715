class View
  def ask_for(thing)
    puts "What's the #{thing}?"
    gets.chomp
  end

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name}: #{recipe.description}"
    end
  end

  def ask_for_index
    puts "What number?"
    gets.chomp.to_i - 1
  end

  # def ask_for_description
  #   puts "What's the description?"
  #   gets.chomp
  # end
end
