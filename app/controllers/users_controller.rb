class UsersController < ApplicationController
  def new
  end


  def credit
  end

  def complete
  end

  def profile
  end

  def show
    @user = User.find(params[:id])
  end

  def mypage_ship
    user = User.find(current_user.id)
    @item = user.items.where(trading_condition: 1)
  end
  def sold
    user = User.find(current_user.id)
    @item = user.items.where(trading_condition: 3)
  end


end
