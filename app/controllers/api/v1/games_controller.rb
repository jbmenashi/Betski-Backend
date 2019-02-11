class Api::V1::GamesController < ApplicationController
  before_action :find_game, only: [:show, :odds, :bets]

  def index
    @games = Game.all
    render json: @games
  end

  def show
    render json: @game
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      render json: @game, status: :accepted
    else
      render json: { errors: @game.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def odds
    render json: @game.odds
  end

  def bets
    render json: @game.bets
  end

  private

  def game_params
    params.permit(:sport, :home_team, :home_score, :home_logo, :away_team, :away_score, :away_logo, :spread, :over_under, :date)
  end

  def find_game
    @game = Game.find(params[:id])
  end
end
