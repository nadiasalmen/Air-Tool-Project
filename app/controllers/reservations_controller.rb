class ReservationsController < ApplicationController
  def index
    skip_authorization
    skip_policy_scope
    @reservations = current_user.reservations
  end

  def show
    skip_authorization
    @reservation = Reservation.find(params[:id])
  end

  def new
    skip_authorization
    @tool = Tool.find(params[:tool_id])
    @reservation = Reservation.new
  end

  def create
    skip_authorization
    @tool = Tool.find(params[:tool_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.tool = @tool
    @reservation.user = current_user
    @reservation.status = "New"
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to reservation_path(@reservation)
    else
      render :edit
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:status, :start_date, :end_start).merge(user_id: current_user.id)
  end

end
