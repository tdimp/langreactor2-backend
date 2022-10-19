class DecksController < ApplicationController
  
  def index
    decks = Deck.where(user_id: session[:user_id])
    render json: decks
  end

  def show
    deck = Deck.find(params[:id])
    render json: deck.cards unless deck.user_id != session[:user_id]
  end

  def create
    deck = Deck.create!(deck_params)
    render json: deck
  end


  private

  def deck_params
    params.permit(:name, :user_id)
  end

  
end
