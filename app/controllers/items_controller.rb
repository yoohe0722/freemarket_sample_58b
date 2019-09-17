class ItemsController < ApplicationController

  before_action :login_check, only: [:buy, :shipping]

  def create
    @item = Item.create(item_params)
  end

  def index
  end

  def mypage
  end

  def logout
  end

  def user_edit
  end

  def identification
  end

  def buy
  end

  def buycheck
  end

  def shipping
  end

  def login_check
    redirect_to "/users/sign_in" unless user_signed_in?
  end

  private
  def item_params
    params.require(:item).permit(:name, images:[])
  end


end
