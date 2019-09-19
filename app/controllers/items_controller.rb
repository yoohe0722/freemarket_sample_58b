class ItemsController < ApplicationController

  before_action :login_check, only: [:buy, :shipping]

  def create
    @item = Item.create(item_params)
    redirect_to root_path
  end

  def index

    @item = Item.all.order('id ASC').limit(5)
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
    @item = Item.all.order('id ASC').limit(5)
  end

  def login_check
    redirect_to "/users/sign_in" unless user_signed_in?
  end

  private
  def item_params
    params.permit(:name, :description, :buyer_id, :size_id, :brand_id, :price, :condition, :category_id, :ship_fee, :ship_method, :prefecture, :ship_date, :trading_condition, images:[]).merge(user_id: current_user.id)
  end
end
