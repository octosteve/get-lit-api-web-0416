class CreateCocktail
  attr_reader :cocktail, :proportions
  def initialize(cocktail, proportions)
    @cocktail = cocktail
    @proportions = proportions
  end

  def call
    c = Cocktail.create(cocktail)
    proportions.map do |proportion|
      name = proportions.first["ingredient-name"]
      i = Ingredient.where(name: name).first_or_create
      pp = Proportion.create(cocktail: c, ingredient: i, amount: proportion[:amount])
    end
    c
  end

  def self.call(cocktail, proportions)
    new(cocktail, proportions).call
  end
end
