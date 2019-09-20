class ItemsController < ApplicationController

  before_action :login_check, only: [:buy, :shipping]

  def create
    @item = Item.create(item_params)
    redirect_to root_path
  end

  def index

    # @item = Item.all.order('id ASC').limit(10)
    @item_category_1 = Item.where(category_id: "1").order('created_at DESC').limit(10)
    @item_category_2 = Item.where(category_id: "2").order('created_at DESC').limit(10)
    @item_category_3 = Item.where(category_id: "8").order('created_at DESC').limit(10)
    @item_category_4 = Item.where(category_id: "6").order('created_at DESC').limit(10)
  end

  def mypage
  end

  def logout
  end

  def user_edit
  end

  def identification
  end

  def show
    @item = Item.find(params[:id])
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
    params.permit(:name, :description, :buyer_id, :size_id, :brand_id, :price, :condition_id, :category_id, :shipfee_id, :shipmethod_id, :prefecture_id, :shipdate_id, :trading_condition, images:[]).merge(user_id: current_user.id)
  end
end
