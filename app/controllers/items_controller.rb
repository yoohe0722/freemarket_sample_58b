class ItemsController < ApplicationController
  require "payjp"
  before_action :login_check, only: [:buy, :shipping]

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      redirect_to ({action: 'shipping'}), alert: '商品出品に失敗しました'
    end
  end

  def index
    @item_category_1 = Item.where(category_id: "1", trading_condition: "1").order('created_at DESC').limit(10)
    @item_category_2 = Item.where(category_id: "2", trading_condition: "1").order('created_at DESC').limit(10)
    @item_category_3 = Item.where(category_id: "8", trading_condition: "1").order('created_at DESC').limit(10)
    @item_category_4 = Item.where(category_id: "6", trading_condition: "1").order('created_at DESC').limit(10)
  end

  def credit
    card = Payment.where(user_id: current_user.id).first
    redirect_to "/payments" if card.present?
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
    @firstimage = @item.images[0]
  end

  def buycheck
    @item = Item.find(params[:id])
    @firstimage = @item.images[0]
  end

  def shipping
  end

  def login_check
    redirect_to "/users/sign_in" unless user_signed_in?
  end

  def pay
    @payment = Payment.where(user_id: current_user.id).first
    if @payment.present?
      @item = Item.find(params[:id])
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        customer: @payment.customer_id, 
        currency: 'jpy',
      )
      @item.update(buyer_id: current_user.id, trading_condition: 3)
      redirect_to root_path, notice: '商品を購入しました'
    else
      redirect_to new_payment_path, alert: '購入にはクレジットカード登録が必要です'
    end
  end

  private
  def item_params
    params.permit(:name, :description, :buyer_id, :size_id, :brand_id, :price, :condition_id, :category_id, :shipfee_id, :shipmethod_id, :prefecture_id, :shipdate_id, :trading_condition, images:[]).merge(user_id: current_user.id)
  end
end