class ProportionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :ingredient_name

  def ingredient_name
    object.ingredient.name
  end
end
