class SignupController < ApplicationController

  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    # step1で入力された値をsessionに保存
    session[:nick_name] = user_params[:nick_name]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user = User.new # 新規インスタンス作成
  end

  def step3
    # step2で入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    @user = User.new # 新規インスタンス作成
  end

  def step4
    # step3で入力された値をsessionに保存
    session[:family_name] = user_params[:family_name]
    session[:family_kana] = user_params[:family_kana]
    session[:first_name] = user_params[:first_name]
    session[:first_kana] = user_params[:first_kana]
    session[:zip] = user_params[:zip]
    session[:prefecture_id] = user_params[:prefecture_id]
    session[:city] = user_params[:city]
    session[:block] = user_params[:block]
    session[:building] = user_params[:building]
    @user = User.new # 新規インスタンス作成
  end


  def complete
    # step2で入力された値をsessionに保存
    session[:family_name] = user_params[:family_name]
    session[:family_kana] = user_params[:family_kana]
    session[:first_name] = user_params[:first_name]
    session[:first_kana] = user_params[:first_kana]
    @user = User.new # 新規インスタンス作成
  end

  private
    # 許可するキーを設定します
    def user_params
      params.require(:user).permit(
        :email,
        :password,
        :password_confirmation,
        :nick_name,
        :family_name,
        :family_kana,
        :first_name,
        :first_kana,
        :phone_number,
        :zip,
        :prefecture_id,
        :city,
        :block,
        :building,
        :payment_id,
    )
    end
end
