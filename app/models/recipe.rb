# frozen_string_literal: true

# Recipe
class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :measure_system
  has_many :food_events
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_and_belongs_to_many :shopping_events, join_table: 'shopping_events_recipes'

  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true
  accepts_nested_attributes_for :measure_system

  before_destroy :delete_s3_bucket_images

  attr_accessor :images

  # validates_presence_of :recipe_ingredients
  validates_presence_of :measure_system
  validates :name, :measure_system, :difficulty, presence: true
  validates :name, length: { minimum: 3 }

  def as_json(options = {})
    json = {}
    recipe_images = find_recipe_images
    
    steps_images = recipe_images.select { |image| image[:image_type] == 'steps_image' }
    formatted_steps = format_steps(steps, steps_images)

    json['id'] = id
    json['name'] = name
    json['steps'] = formatted_steps
    json['preparation_time'] = preparation_time
    json['cooking_time'] = cooking_time
    json['difficulty'] = difficulty
    json['measure_system'] = measure_system.name
    json['comments'] = comments
    json['user_id'] = user_id
    json['created_at'] = created_at
    json['updated_at'] = updated_at
    json['recipe_ingredients'] = recipe_ingredients
    json['images_quantity'] = recipe_images.length
    json['main_image'] = recipe_images.select { |image| image[:image_type] == 'main_image' }
    json['recipe_images'] = recipe_images.select { |image| image[:image_type] == 'recipe_images' }
    json
  end

  def find_recipe_images
    S3Service.new(user).download_images(id)
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

  def delete_s3_bucket_images
    s3 = S3Service.new(user).delete_recipe_images(id)
  end
end
