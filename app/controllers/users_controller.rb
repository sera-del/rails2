class UsersController < ApplicationController
  
  def account
    @user_id = current_user.id
  end

  def profile
    @user_id = current_user.id
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params_profile)
      flash[:notice_chabge_profile] = "プロフィール情報を更新しました"
      redirect_to '/users/profile'
    else
      render "edit"
    end
  end


  private

  def params_profile
    params.require(:user).permit(:user_img, :username, :introduction)
  end

end
