class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @users = User.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    
    if @room.save
      flash[:notice_room] = "施設が作成されました"
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  #ユーザーごとに作成した部屋を表示するためのメソッド
  def own
    @rooms = current_user.rooms
  end

  #検索アクション
  def search
    if !params[:search_keyword].present? || params[:search_area].present?
      @rooms = Room.where('address LIKE(?)', "%#{params[:search_area]}%")
    elsif params[:search_keyword].present?
      @rooms = Room.where('accommodation LIKE(?) OR accommodation_detail LIKE(?)', "%#{params[:search_keyword]}%", "%#{params[:search_keyword]}%")
    else
      @rooms = Room.all
    end
  end

  private

  def room_params
    params.require(:room).permit(:accommodation, :accommodation_detail, :price, :address, :img).merge(user_id: current_user.id)
  end
end
