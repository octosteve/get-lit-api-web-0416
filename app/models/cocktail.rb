class Cocktail < ActiveRecord::Base
  has_many :proportions
  has_many :ingredients, through: :proportions

  def self.new_from_book(recipe)
    troublesome = ["Jules Bergeron, Trader Vic’s Bartenders Guide, 1972","George Kappeler, Modern American Drinks, 1895"]
    if troublesome.include?(recipe.last)
      recipe.last.prepend("-")
    end

    # Seriously unicode...
    recipe.last.gsub!("-", "-")

    unless recipe.last.start_with?("-")
      index = recipe.index {|x| x.start_with?('—')}
      dependencies = recipe[index + 1..-1]
      recipe = recipe[0..index]
    end

    name = recipe.shift
    description = recipe.shift
    source = recipe.pop
    ingredients = recipe.take_while {|line| line =~ /^(.)?\d/}
    instructions = recipe.drop_while {|line| line =~ /^(.)?\d/}
    recipe = create(name: name, description: description, instructions: instructions.join(". "), source: source)
    Ingredient.new_from_list(recipe, ingredients)
  end
end
