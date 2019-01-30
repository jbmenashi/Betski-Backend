class Api::V1::OddsController < ApplicationController
  before_action :find_odd, only: [:show]

  def index
    @odds = Odd.all
    render json: @odds
  end

  def show
    render json: @odd
  end

  def create
    @odd = Odd.new(odd_params)
    if @odd.save
      render json: @odd, status: :accepted
    else
      render json: { errors: @odd.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def odd_params
    params.permit(:game_id, :line, :home_under, :away_over)
  end

  def find_odd
    @odd = Odd.find(params[:id])
  end
end
