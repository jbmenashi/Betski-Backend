class Api::V1::BetsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]
  before_action :find_bet, only: [:show, :update, :destroy]
  def index
    @bets = Bet.all
    render json: @bets
  end

  def show
    render json: @bet
  end

  def create
    @bet = Bet.new(bet_params)
    if @bet.save
      render json: @bet, status: :accepted
    else
      render json: { errors: @bet.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @bet.update(bet_params)
    if @bet.save
      render json: @bet, status: :accepted
    else
      render json: { errors: @bet.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @bet.destroy
  end

  private

  def bet_params
    params.permit(:game_id, :ticket_id, :multiplier, :team, :variety, :line, :odds, :away, :home)
  end

  def find_bet
    @bet = Bet.find(params[:id])
  end
end
