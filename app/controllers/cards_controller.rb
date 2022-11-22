class CardsController < ApplicationController

  
  
  def index
    @current_user = find_current_user
    render json: @current_user.cards
  end

  def show
    card = find_card
    render json: card
  end

  def create
    render json: Card.create!(card_params)
  end

  def update
    card = find_card
    card.update!(card_params)
    # DeckCard.find().... google how to update attributes in join tables (might need to accept a collection and update that way) 
    # https://kolosek.com/rails-join-table/
    render json: card
  end

  def destroy
    card = find_card
    card.destroy
    head :no_content
  end

  def search
    cards = filtered_cards
    byebug
    render json: cards
  end

  private

  def find_current_user
    @current_user = User.find(session[:user_id])
  end

  def find_card
    card = find_current_user.cards.find(params[:id])
  end

  def find_deck
    deck = find_current_user.decks.find(params[:deck_ids])
  end

  def card_params
    params.permit(:foreign_language, :primary_lang_txt, :foreign_lang_txt, :img_url, :user_id, deck_ids: []) # Added deck_ids as a permitted parameter.
  end

  def filtered_cards
    cards = Card.all.each do |c|
      filtered_cards = []
      filtered_cards << c if c.foreign_lang_txt.include?("ca") or c.primary_lang_txt.include?(params[:search])
      filtered_cards
    end
  end
end
