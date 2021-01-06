class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :preparation_time, :cooking_time, :difficulty, :measure_system, :comments, :user_id, :steps
  has_many :recipe_ingredients

  def steps
    recipe_images = find_recipe_images
    steps_images = recipe_images.select { |image| image[:image_type] == 'steps_image' }

    format_steps(object.steps, steps_images)
  end

  def measure_system
    object.measure_system.name
  end

  private
  def find_recipe_images
    user = User.find_by(id: object.user_id)
    S3Service.new(user).download_images(object.user_id)
  end

  private

  def format_steps(steps, steps_images)
    steps_hash = Hash[*(steps.split('-'))]
    formatted_steps = steps_hash.to_a.map! {|step| { name: step[0], description: step[1], images: [] }}

    steps_images.each do |image|
      index = image[:step_number].scan(/\d/).join('').to_i - 1
      formatted_steps[index][:images].push(image)
    end

    formatted_steps
  end
end
