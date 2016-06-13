class Ingredient < ActiveRecord::Base
  has_many :proportions
  has_many :cocktails, through: :proportions
  
  def self.new_from_list(cocktail, ingredients)
    ingredients.each do |ingredient|
      amount, name = ingredient.scan(/^(.*? (?:oz.|dashes|dash|barspoon|Slices|tsp.)?) ?((?:Mint)?.*?(?:Leaves|Cube|Egg)?)$/).flatten
      name.gsub!("Hendricks Gin", "Hendrick's Gin")
      name.gsub!("Hendrick’s Gin", "Hendrick's Gin")
      name.gsub!("Amaro Ciociara", "Amaro Ciociaro")
      name.gsub!("Angostura bitters", "Angostura Bitters")
      name.gsub!("Bärenjäger Honey Liqueur", "Bärenjäger")
      name.gsub!("Laird’ s Bonded Apple Brandy", "Laird’s Bonded Apple Brandy")
      name.gsub!("Elijah Craig 12-Year-Old Bourbon Whiskey", "Elijah Craig 12-Year-Old Bourbon")
      name.gsub!("Fee Brothers Whiskey Barrel Aged Bitters", "Fee Brothers Whiskey Barrel-Aged Bitters")
      name.gsub!("Fernet Branca", "Fernet-Branca")
      name.gsub!("Marie Brizard White Crème De Cacao.", "Marie Brizard White Crème De Cacao")
      name.gsub!("Red Jacket Orchard Apple Cider", "Red Jacket Orchards Apple Cider")
      name.gsub!(/Rhum Clément V.S.O.P$/, "Rhum Clément V.S.O.P.")
      name = name.titleize
      i = where(name: name.strip).first_or_create(name:name.strip)
      i.proportions.create(amount:amount, cocktail: cocktail)
    end
  end
end
