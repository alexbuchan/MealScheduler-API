class RecipeIngredient < ApplicationRecord
  belongs_to :recipe, dependent: :destroy
  belongs_to :ingredient

  validates :amount, :unit_of_measurement, presence: true
  validates :amount, numericality: { greater_than: 0 }

  def as_json(options = {})
    json = super(options)
    json['name'] = ingredient.name
    json
  end
end
