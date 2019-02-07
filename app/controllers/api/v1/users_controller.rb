class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]
  before_action :find_user, only: [:show, :update, :tickets, :bets]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({user_id: @user.id})
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
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
    @bets = Bet.select {|bet| bet.user == @user && bet.ticket == @ticket}
    render json: @bets
  end

  private

  def user_params
    params.permit(:username, :password, :balance)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
