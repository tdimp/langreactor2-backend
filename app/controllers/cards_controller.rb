class CardsController < ApplicationController
  before_action :authorize
  rescue_from ActiveRecord::RecordInvalid, with: :handle_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found_response

  def index
    render json: Card.all
  end

  def show
    card = find_card
    render json: card
  end

  def create
    card = Card.create!(card_params)
    render json: card
  end

  def update
    card = find_card
    card.update(card_params)
    render json: card
  end

  def destroy
    card = find_card
    card.destroy
    head :no_content
  end

  private

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

  def find_card
    card = Card.find(params[:id])
  end

  def card_params
    params.permit(:foreign_language, :primary_lang_txt, :foreign_lang_txt, :img_url)
  end

  def handle_unprocessable_entity_response(exception)
    render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

  def handle_not_found_response
    render json: { error: "Card not found" }, status: :not_found
  end
end
