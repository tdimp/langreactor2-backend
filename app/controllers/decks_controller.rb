class DecksController < ApplicationController
  before_action :authorize
  rescue_from ActiveRecord::RecordInvalid, with: :handle_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found_response

  def index
    decks = Deck.where(user_id: session[:user_id])
    render json: decks
  end

  def show
    deck = Deck.where(user_id: session[:user_id]).find(params[:id]) # This kinda works but needs to be refactored and needs error handling
    render json: deck.cards
  end



  private

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

  def handle_unprocessable_entity_response(exception)
    render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

  def handle_not_found_response
    render json: { error: "Deck not found" }, status: :not_found
  end

end
