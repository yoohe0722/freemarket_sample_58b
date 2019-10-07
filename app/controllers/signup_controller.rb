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
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]
    session[:family_name] = user_params[:family_name]
    session[:family_kana] = user_params[:family_kana]
    session[:first_name] = user_params[:first_name]
    session[:first_kana] = user_params[:first_kana]

    @user = User.new # 新規インスタンス作成
  end

  def step3
    # step2で入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    @user = User.new # 新規インスタンス作成
  end

  def step4
    # step3で入力された値をsessionに保存
    session[:zip] = user_params[:zip]
    session[:prefecture_id] = user_params[:prefecture_id]
    session[:city] = user_params[:city]
    session[:block] = user_params[:block]
    session[:building] = user_params[:building]
    @user = User.new # 新規インスタンス作成
  end


  def complete
    sign_in User.find(session[:id]) unless user_signed_in?
    render :complete
  end

  def create
    @user = User.new(
      nick_name: session[:nick_name], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_kana: session[:family_kana],
      first_kana: session[:first_kana],
      phone_number: session[:phone_number],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      zip: session[:zip],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      block: session[:block],
      building: session[:building],
      payment_id: session[:payment_id],
    )
    if @user.save
      session[:id] = @user.id
      redirect_to complete_signup_index_path
    else
      render '/signup/step1'
    end
  end


  private
    # 許可するキーを設定します
    def user_params
      params.fetch(:user,{}).permit(
        :email,
        :password,
        :password_confirmation,
        :nick_name,
        :family_name,
        :family_kana,
        :first_name,
        :first_kana,
        :phone_number,
        :birth_year,
        :birth_month,
        :birth_day,
        :zip,
        :prefecture_id,
        :city,
        :block,
        :building,
        :payment_id,
    )
    end
end
