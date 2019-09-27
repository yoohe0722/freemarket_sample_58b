class UsersController < ApplicationController
  before_action :set_user, only: [:new,:edit,:update,:show,:mypage_ship]
  def new
  end

  def edit
  end

  def update
    if @user.id == current_user.id
      binding.pry
      @user.update_columns(user_update_params)
      redirect_to user_path, notice: 'ユーザー情報を更新しました'
    else
      render user_path, notice: 'ユーザー情報の更新に失敗しました'
    end

  end

  def credit
  end

  def complete
  end

  def show
  end

  def mypage_ship
    @item = user.items.all
  end

  private
  def user_update_params
    # binding.pry
    params.permit(:nick_name, :image, :profile)
    # binding.pry
  end

  def set_user
    @user = User.find(params[:id])
  end
  
end
