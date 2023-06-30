class UsersController < ApplicationController
  
  def account
    @user = current_user.id
  end

  def profile
  end

end
