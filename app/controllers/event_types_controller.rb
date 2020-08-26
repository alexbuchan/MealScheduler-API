class EventTypesController < ApplicationController
  before_action :authorize_request

  def index
    event_types = EventType.all
    render json: event_types
  end
end