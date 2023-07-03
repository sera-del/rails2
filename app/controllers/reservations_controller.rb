class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end

  def confirm
   @reservation = Reservation.new(reservation_check)
   @user_id = current_user.id
   @room = Room.find_by(params[:room_id])
   @day = (@reservation.check_out - @reservation.check_in).to_i
   @total = @day * @reservation.price * @reservation.people
  end

  def create
    @reservation = Reservation.new(reservation_room)
    if @reservation.save
      flash[:notice_reservation] = "施設を予約しました"
      redirect_to :reservations
    else
      render "confirm"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  private

  def reservation_check
    params.permit(:check_in, :check_out, :people, :price, :room_id)
  end

  def reservation_room
    params.require(:reservation).permit(:img, :accommodation, :accommodation_detail, :price, :check_in, :check_out, :room_id, :user_id, :day, :people)
  end

end
