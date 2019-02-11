class Api::V1::TeamsController < ApplicationController
  before_action :find_team, only: [:show]
  def index
    @teams = Team.all
    render json: @teams
  end

  def show
    render json: @team
  end

  private

  def find_team
    @team = Team.find(params[:id])
  end
end
