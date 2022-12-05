class UsersController < ApplicationController
  skip_before_action :authorize, only: [:show, :create, :language_partner]
 
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

  def language_partner
    #filtered_cards = Card.all.select do |c|
    #  c.foreign_language == params[:language]
    #end
#
    #users_array = filtered_cards.pluck(:user_id)
#
    #users = users_array.map do |u|
    #  User.find(u)
    #end

    users = User.joins(:cards).where("cards.foreign_language" => params[:language])

    # Create set out of users_array
    # Return user info for each user in set as user_set

    render json: users, include: :cards
  end

  private

  def find_user
    user = User.find(params[:id])
  end

  def user_params
    params.permit(:username, :password, :password_confirmation, :primary_language)
  end
end
