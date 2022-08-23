class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :handle_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found_response
  
  def index
    users = User.all
    render json: users
  end
  
  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.create!(user_params)
    render json: user, status: :created  
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head :no_content
  end

  private

  def find_user
    user = User.find(params[:id])
  end

  def user_params
    params.permit(:username, :password, :password_confirmation, :primary_language)
  end

  def handle_unprocessable_entity_response(exception)
    render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

  def handle_not_found_response
    render json: { error: "User not found." }, status: :not_found
  end
end
