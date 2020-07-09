class SchedulerController < ApplicationController
  before_action :authorize_request

  def create
    scheduler = Scheduler.new(scheduler_params)
    render json: scheduler.as_json
  end

  private

  def scheduler_params
    params.require(:scheduler).permit(
      :month,
      :year
    ).to_h.symbolize_keys
  end
end