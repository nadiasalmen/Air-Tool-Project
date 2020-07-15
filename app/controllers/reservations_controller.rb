class ReservationsController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @tool = Tool.find(params[:tool_id])
    @reservation = Reservation.new
  end

  def create
    @tool = Tool.find(params[:tool_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.tool = @tool
    @reservation.user = current_user
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
    params.require(:reservation).permit(:status, :start_date, :end_start)
  end
end
