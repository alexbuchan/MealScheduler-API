class EventsController < ApplicationController
  before_action :authorize_request

  def index
    events = current_user.events
    render json: events
  end

  def create
    event = current_user.events.new(event_params)

    if event.save
      render json: { message: 'Event successfully created' }, status: :created
    else
      render json: { errors: event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    event = current_user.event.find_by_id(event_params[:id])

    if event
      render json: event
    else
      render json: { errors: ["Cannot find requested event with id: #{params[:id]}"] }, status: :not_found
    end
  end

  def update
    event = current_user.event.find_by_id(event_params[:id])

    if event.update(event_params)
      render json: { message: 'Event successfully updated' }, status: :accepted
    else
      render json: { errors: event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    event = current_user.events.find_by_id!(params[:id])

    if event.destroy
      render json: { message: 'Event successfully deleted' }, status: :ok
    else
      render json: { errors: event.errors.full_messages }, status: :not_acceptable
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :id,
      :title,
      :event_type,
      :date,
      :begin_time,
      :end_time,
      :comments,
      food_event_attributes: [
        :recipe_id
      ],
      shopping_event_attributes: [
        :date_range,
        recipe_ids: [],
      ],
      event_type_attributes: [
        :name
      ]
    ).to_h.symbolize_keys
  end
end