class DateFrequenciesController < ApplicationController
  before_action :authorize_request

  def index
    date_frequencies = DateFrequency.all
    render json: date_frequencies
  end
end