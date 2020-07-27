# frozen_string_literal: true

# IngredientsController
class IngredientsController < ApplicationController
  before_action :authorize_request

  # GET /ingredients/all
  def index
    ingredients = Ingredient.all
    render json: ingredients
  end

  # POST /ingredients/
  def create
    ingredient = Ingredient.create(ingredient_params)
    if ingredient.save
      render json: { message: 'Ingredient successfully created' }, status: :created
    else
      render json: { errors: ingredient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /ingredients/:id
  def show
    ingredient = Ingredient.find_by_id!(params[:id])
    if ingredient
      render json: ingredient
    else
      render json: { errors: ["Cannot find requested ingredient with id: #{params[:id]}"] }, status: :not_found
    end
  end

  # PATCH /ingredients/:id
  def update
    ingredient = Ingredient.find_by_id(params[:id])
    if ingredient.update(ingredient_params)
      render json: { message: 'Ingredient successfully updated' }, status: :accepted
    else
      render json: { errors: ingredient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /ingredient/:id
  def destroy
    ingredient = Ingredient.find_by_id!(params[:id])
    if ingredient.destroy
      render json: { message: 'Ingredient successfully deleted' }, status: :ok
    else
      render json: { errors: ingredient.errors.full_messages }, status: :not_acceptable
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(
      :id,
      :name,
      :measure_unit_type_id
    ).to_h.symbolize_keys
  end
end