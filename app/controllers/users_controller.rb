class UsersController < ApplicationController
  def new
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user.update(user_update_params)
      redirect_to user_path, notice: 'ユーザー情報を更新しました'
    else
      render user_path, notice: 'ユーザー情報の更新に失敗しました'
    end

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
    @item = user.items.all
  end

  private
  def user_update_params
    # binding.pry
    params.fetch(:user,{}).permit(:nick_name, :image, :profile).merge(current_user.id)
  end
end
