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

end
