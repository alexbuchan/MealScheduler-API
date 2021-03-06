class ApplicationController < ActionController::Base
  protect_from_forgery
  attr_reader :current_user

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    if header.nil?
      render json: { error: 'You must login to perform this action' }, status: :unauthorized
    else
      begin
        @decoded = JsonWebToken.decode(header)
        @current_user = User.find(@decoded[:user][:id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { error: e.message }, status: :unauthorized
      rescue JWT::DecodeError => e
        render json: { error: e.message }, status: :unauthorized
      end
    end
  end

  def access_denied(exception)
    redirect_to '/', alert: exception.message
  end
end
