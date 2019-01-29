class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:show, :create, :update, :tickets, :bets]
  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def tickets
    render json: @user.tickets
  end

  def bets
    @ticket = Ticket.find(params[:ticket_id])
    @bets = Event.select {|bet| bet.user == @user && bet.ticket == @ticket}
    render json: @bets
  end

  private

  def user_params
    params.permit(:username, :balance)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
