class DecksController < ApplicationController
  #before_action :authorize
  rescue_from ActiveRecord::RecordInvalid, with: :handle_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found_response

  def index
    #byebug
    user = User.find(1)
    render json: user.decks
  end

  def show
    deck = Deck.find(params[:id])
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
