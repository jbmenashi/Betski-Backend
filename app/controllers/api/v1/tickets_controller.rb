class Api::V1::TicketsController < ApplicationController
  before_action :find_ticket, only: [:show, :update, :destroy, :bets]
  def index
    @tickets = Ticket.all
    render json: @tickets
  end

  def show
    render json: @ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      render json: @ticket, status: :accepted
    else
      render json: { errors: @ticket.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @ticket.update(ticket_params)
    if @ticket.save
      render json: @ticket, status: :accepted
    else
      render json: { errors: @ticket.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @ticket.destroy
  end

  def bets
    render json: @ticket.bets
  end


  private

  def ticket_params
    params.permit(:user_id, :wager, :payout, :submitted, :closed, :result)
  end

  def find_ticket
    @ticket = Ticket.find(params[:id])
  end
end
