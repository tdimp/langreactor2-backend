class DecksController < ApplicationController
  
  def index
    @current_user = find_current_user
    decks = @current_user.decks
    render json: decks
  end

  def show
    @current_user = find_current_user
    deck = @current_user.decks.find(params[:id])
    render json: deck.cards
  end

  def create
    deck = Deck.create!(deck_params)
    render json: deck
  end


  private

  def find_current_user
    @current_user = User.find(session[:user_id])
  end

  def deck_params
    params.permit(:name, :user_id)
  end

  
end
