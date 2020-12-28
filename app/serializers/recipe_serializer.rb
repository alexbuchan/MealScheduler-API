class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :preparation_time, :cooking_time, :difficulty, :measure_system, :comments, :user_id
  has_many :steps, each_serializer: StepSerializer
  has_many :recipe_ingredients

  def measure_system
    object.measure_system.name
  end
end
