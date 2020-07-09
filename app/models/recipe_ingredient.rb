class RecipeIngredient < ApplicationRecord
  belongs_to :recipe, dependent: :destroy
  belongs_to :ingredient

  def as_json(options = {})
    json = super(options)
    json['name'] = ingredient.name
    json
  end
end
