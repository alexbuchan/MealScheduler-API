# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  def register
    @user = User.new(user_params)

    if @user.save
      payload = {
        user: { id: @user.id, username: @user.username, email: @user.email },
        message: 'User registered'
      }

      render json: { token: encode_token(payload) }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by_email(user_params[:email])

    if @user&.authenticate(user_params[:password])
      payload = {
        user: { id: @user.id, username: @user.username, email: @user.email },
        message: 'User logged in'
      }

      render json: { token: encode_token(payload) }, status: :ok
    else
      render json: { errors: 'Incorrect user credentials' }, status: :unauthorized
    end
  end

  private

  def encode_token(payload)
    JsonWebToken.encode(payload)
  end

  def user_params
    params.require(:user).permit(:id, :username, :email, :password).to_h.symbolize_keys
  end
end