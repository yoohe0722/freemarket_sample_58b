class ItemsController < ApplicationController
  require "payjp"
  before_action :login_check, except: [:index, :show]
  before_action :set_item, only: [:show, :show_edit_delete, :destroy, :edit, :update, :buy]
  before_action :set_first_image, only: [:show, :show_edit_delete, :buy]
  before_action :set_category_parents, only: [:new, :edit]
  before_action :set_initial_category, only: [:edit]
  before_action :set_trading_condition, only: [:edit, :update, :destroy]


  def index
    category_1 = Category.find_by(name: "レディース").subtree
    @item_category_1 = Item.where(category_id: category_1, trading_condition: "1").order('created_at DESC').limit(10)

    category_2 = Category.find_by(name: "メンズ").subtree
    @item_category_2 = Item.where(category_id: category_2, trading_condition: "1").order('created_at DESC').limit(10)

    category_3 = Category.find_by(name: "家電・スマホ・カメラ").subtree
    @item_category_3 = Item.where(category_id: category_3, trading_condition: "1").order('created_at DESC').limit(10)

    category_4 = Category.find_by(name: "おもちゃ・ホビー・グッズ").subtree
    @item_category_4 = Item.where(category_id: category_4, trading_condition: "1").order('created_at DESC').limit(10)
  end

  def new

  end
  
  def create
    @item = Item.new(item_params)
    if params[:images].present?
      if @item.save
        redirect_to root_path, notice: '商品を出品しました'
      else
        redirect_to ({action: 'new'}), alert: '商品出品に失敗しました'
      end
    else
      flash.now[:alert] = '商品画像を最低1枚添付してください'
      render :new
    end
  end


  def edit
    if @item.user_id != current_user.id
      redirect_to root_path, alert: 'ログインユーザーでないため、この商品を編集できません。'
    end
  end

  def update
    if @item.user_id == current_user.id
      if params[:item][:image_ids].present?
        if params[:item][:images].blank? && params[:item][:image_ids].length == @item.images.length
          redirect_to edit_item_path, alert: '画像がありません'
          return
        end
        params[:item][:image_ids].each do |image_id|
          image = @item.images.find(image_id)
          image.purge
        end
      end
      @item.update(item_update_params)
      redirect_to root_path, notice: '商品を編集しました'
    else
      redirect_to root_path, alert: '商品編集に失敗しました'
    end
  end

  def show
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path, notice: '商品を削除しました'
    else
      redirect_to root_path, alert: 'ログインユーザーでないため、商品の削除に失敗しました。'
    end
  end

  def credit
    card = Payment.where(user_id: current_user.id).first
    redirect_to "/payments" if card.present?
  end

  def show_edit_delete
  end

  def buy
    redirect_to item_path(@item.id) if @item.user_id == current_user.id
    redirect_to root_path(@item.id) if @item.trading_condition == 3
  end

  def search_children
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
      end
    end
  end

  def search_grand_children
    respond_to do |format|
      format.html
      format.json do
        @grand_children = Category.find(params[:parent_id]).children
      end
    end
  end

  def pay
    @payment = Payment.where(user_id: current_user.id).first
    if @payment.present?
      @item = Item.find(params[:id])
      Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
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
    params.permit(:name, :description, :buyer_id, :size_id, :category_id, :brand_id, :price, :condition_id, :shipfee_id, :shipmethod_id, :prefecture_id, :shipdate_id, :trading_condition, images:[]).merge(user_id: current_user.id)
  end

  def item_update_params
    params.require(:item).permit(:name, :description, :buyer_id, :size_id, :brand_id, :price, :condition_id, :category_id, :shipfee_id, :shipmethod_id, :prefecture_id, :shipdate_id, :trading_condition, images:[]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_first_image
    @firstimage = @item.images[0]
  end

  def set_category_parents
    @parents = Category.where(ancestry: nil).order("id ASC")
  end

  def set_initial_category
    @initial_children = Category.where(ancestry: "#{@item.category.parent.parent.id}").order("id ASC")
    @initial_grandchildren = Category.where(ancestry: "#{@item.category.parent.parent.id}/#{@item.category.parent.id}").order("id ASC")
  end

  def login_check
    redirect_to "/users/sign_in" unless user_signed_in?
  end

  def set_trading_condition
      if @item.trading_condition == 3
      redirect_to edit_delete_items_path, alert: 'この商品はすでに売却済みです'
    end
  end

end
