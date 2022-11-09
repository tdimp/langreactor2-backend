class UsersController < ApplicationController
  skip_before_action :authorize, only: [:show, :create]
 
  def index
    render json: User.all
  end
  
  def show
    user = User.find_by(id: session[:user_id])
    if user
      render json: user
    else
      render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
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
end
