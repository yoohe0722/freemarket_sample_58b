class UsersController < ApplicationController
  def new
  end


  def credit
  end

  def complete
  end

  def address_input
  end

  def phone_authentication
  end

  def profile
  end
  
  def show
    @user = User.find(params[:id])
  end

  def mypage_ship
  end

end
