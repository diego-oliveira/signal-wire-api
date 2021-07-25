class Api::V1::TicketsController < ApplicationController
  def create
    ticket = Ticket.new(ticket_params)
    ticket.save!
    render json: {}, status: 201
  end

  private

  def ticket_params
    params.permit(:title, :user_id)
  end
end
