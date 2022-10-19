class CardsController < ApplicationController
  
  def index
    render json: Card.where(created_by: session[:user_id])
  end

  def show
    card = find_card
    render json: card
  end

  def create
    deck = find_deck
    #byebug
    render json: deck.cards.create!(card_params)
  end

  def update
    card = find_card
    card.update!(card_params)
    render json: card
  end

  def destroy
    card = find_card
    card.destroy
    head :no_content
  end

  private

  def find_card
    card = Card.find(params[:id])
  end

  def find_deck
    deck = Deck.find(params[:deck_id])
  end

  def card_params
    params.permit(:foreign_language, :primary_lang_txt, :foreign_lang_txt, :img_url, :created_by)
  end
end
