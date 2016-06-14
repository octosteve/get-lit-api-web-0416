class CocktailSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :instructions, :source
  has_many :proportions
end
