# frozen_string_literal: true

# RecipesController
class RecipesController < ApplicationController
  before_action :authorize_request

  # GET /recipes/all
  def index
    recipes = current_user.recipes
    render json: recipes
  end

  # POST /recipes/
  def create
    recipe = current_user.recipes.new(recipe_params)
    if recipe.save!
      render json: { message: 'Recipe successfully created', recipe_id: recipe.id }, status: :created
    else
      render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # POST /recipe_images_upload
  def recipe_images_upload
    if has_images?
      save_images_to_s3
    end
  end

  # GET /recipes/:id
  def show
    recipe = current_user.recipes.find_by_id!(params[:id])
    if recipe
      render json: recipe
    else
      render json: { errors: ["Cannot find requested recipe with id: #{params[:id]}"] }, status: :not_found
    end
  end

  # PATCH /recipes/:id
  def update
    recipe = current_user.recipes.find_by_id(params[:id])
    if recipe.update(recipe_params)
      render json: { message: 'Recipe successfully updated' }, status: :accepted
    else
      render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/:id
  def destroy
    recipe = current_user.recipes.find_by_id!(params[:id])
    if recipe.destroy
      render json: { message: 'Recipe successfully deleted' }, status: :ok
    else
      render json: { errors: recipe.errors.full_messages }, status: :not_acceptable
    end
  end

  private

  def save_images_to_s3
    s3 = S3Service.new(@current_user)
    params['images_quantity'].to_i.times do |index|
      s3.upload_image(
        params['recipe_id'],
        params["file_#{index}_file"],
        params["file_#{index}_image_type"],
        params["file_#{index}_order_index"],
        params["file_#{index}_step"]
      )
    end
  end

  def has_images?
    params['images_quantity'].to_i > 0
  end

  def recipe_params
    params.require(:recipe).permit(
      :id,
      :name,
      :images,
      :comments,
      :preparation_time,
      :cooking_time,
      :difficulty,
      :steps,
      :measure_system_id,
      recipe_ingredients_attributes: [
        :ingredient_id,
        :amount,
        :measure_unit_id
      ]
    ).to_h.symbolize_keys
  end
end