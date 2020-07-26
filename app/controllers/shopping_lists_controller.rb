class ShoppingListsController < ApplicationController
  before_action :authorize_request

  def create
    shopping_list = ShoppingList.new(current_user, shopping_list_params).build
    render json: shopping_list.as_json
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(date_range: [], extra_ingredients: [:name, :amount, :measure_unit]).to_h.symbolize_keys
  end
end