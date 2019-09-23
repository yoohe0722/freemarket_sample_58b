class PaymentsController < ApplicationController
  require "payjp"
  before_action :set_card

  def new # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    card = Payment.where(user_id: current_user.id).first
    # redirect_to action: "index" if card.present?
  end

  def create #PayjpとCardのデータベースを作成
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(card: params['payjp-token'])
      @payment = Payment.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @payment.save
        redirect_to action: "/items/credit"
      else
        redirect_to action: "new"
      end
    end
  end

  private

  def set_card
    @payment = Payment.where(user_id: current_user.id).first if Payment.where(user_id: current_user.id).present?
  end
end