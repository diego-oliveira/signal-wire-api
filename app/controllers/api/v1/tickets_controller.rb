class Api::V1::TicketsController < ApplicationController
  def create
    ticket = Ticket.new(ticket_params)
    ticket.tags = build_tags
    ticket.save!
    render json: ticket, status: 201
  end

  private

  def ticket_params
    params.permit(:title, :user_id)
  end

  def tag_params
    params.permit(tags: [])
  end

  def build_tags
    (tag_params[:tags] || []).map do |tag|
      Tag.find_or_initialize_by(name: tag)
    end
  end
end
