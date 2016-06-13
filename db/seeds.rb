recipes = File.readlines('db/pdt_recipes.txt')
recipes.map! {|recipe| recipe.strip}.reject! {|recipe| recipe.empty?}

recipes = recipes.slice_before {|recipe| recipe.upcase == recipe}.map do |recipe|
  Cocktail.new_from_book(recipe)
end
