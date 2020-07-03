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
    if recipe.save
      render json: { message: 'Recipe successfully created' }, status: :created
    else
      render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
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

  def recipe_params
    params.require(:recipe).permit(
      :id,
      :name,
      :comments,
      :preparation_time,
      :cooking_time,
      :difficulty,
      :system_of_measurement,
      recipe_ingredients_attributes: [
        :ingredient_id,
        :amount,
        :unit_of_measurement
      ],
      steps: [],
    ).to_h.symbolize_keys
  end
end