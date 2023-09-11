class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end

  def confirm
   @reservation = Reservation.new(reservation_check)
   @user_id = current_user.id
   @room = Room.find_by(params[:room_id])

   if @reservation.check_in == nil || @reservation.check_out == nil || @reservation.people == nil
    flash[:alert_blank] = "予約に失敗しました。未入力の必須項目があります。"
    redirect_to room_path(@reservation.room_id) and return
   elsif @reservation.check_out < @reservation.check_in || @reservation.check_in == @reservation.check_out
    flash[:alert_day] = "チェックアウトはチェックイン以前に指定できません。"
    redirect_to room_path(@reservation.room_id) and return
   elsif @reservation.people < 0 || @reservation.people == 0
    flash[:alert_number] = "人数を0以下にできません。"
    redirect_to room_path(@reservation.room_id) and return
   else
    @day = (@reservation.check_out - @reservation.check_in).to_i
    @total = @day * @reservation.price * @reservation.people
   end
  end

  def create
    @reservation = Reservation.new(reservation_room)
    if @reservation.save
      flash[:notice_reservation] = "施設を予約しました"
      redirect_to :reservations
    else
      redirect_to room_path(@reservation.room_id) and return
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
