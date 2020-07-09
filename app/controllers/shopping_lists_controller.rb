class ShoppingListsController < ApplicationController
  before_action :authorize_request

  def create
    shopping_list = ShoppingList.new(shopping_list_params).build
    render json: shopping_list.as_json
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(date_range: []).to_h.symbolize_keys
  end
end