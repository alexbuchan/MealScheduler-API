class EventsController < ApplicationController
  before_action :authorize_request

  def index
    events = current_user.events
    render json: events, each_serializer: EventSerializer
  end

  def create
    event = current_user.events.new(event_params[:event])
    @klass = event_params[:event]['eventable_type'].constantize
    event.eventable = @klass.new(event_params[:specific_event_data]) # unless event_params[:specific_event_data].empty?

    if event.save!
      render json: { message: 'Event successfully created' }, status: :created
    else
      render json: { errors: event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    event = current_user.events.find_by!(id: params[:id])

    if event
      render json: event, serializer: EventSerializer
    else
      render json: { errors: ["Cannot find requested event with id: #{params[:id]}"] }, status: :not_found
    end
  end

  def update
    event = current_user.event.find_by_id(event_params[:event]['id'])

    if event.update!(event_params[:event])
      render json: { message: 'Event successfully updated' }, status: :accepted
    else
      render json: { errors: event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    event = current_user.events.find_by_id!(params[:id])

    if event.destroy!
      render json: { message: 'Event successfully deleted' }, status: :ok
    else
      render json: { errors: event.errors.full_messages }, status: :not_acceptable
    end
  end

  def event_types
    event_types = Eventable.all_polymorphic_types(:eventable).map(&:to_s)
    render json: event_types
  end

  private
  
  def event_params
    params.require(:event).permit(
      event: [:id, :title, :eventable_type, :date, :begin_at, :end_at, :comments],
      specific_event_data: [:date_frequency_id, recipe_ids: []]
    ).to_h.symbolize_keys
  end
end