class PaymentsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index
    if @payment.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(@payment.customer_id)
      @customer_card = customer.cards.retrieve(@payment.card_id)
    end
  end

  def new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]

    if params['payjp-token'].blank?
      redirect_to action: "new", alert: '登録に失敗しました'
    else
      customer = Payjp::Customer.create(card: params['payjp-token'])
      @payment = Payment.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @payment.save
        redirect_to controller: "items", action: "credit"
      else
        redirect_to new_payment_path, alert: '登録に失敗しました'
      end
    end
  end

  def destroy
    if @payment.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(@payment.customer_id)
      customer.delete
      @payment.delete
      redirect_to new_payment_path, notice: '削除しました' 
    end
  end

  private
  def set_card
    @payment = Payment.where(user_id: current_user.id).first if Payment.where(user_id: current_user.id).present?
  end
end