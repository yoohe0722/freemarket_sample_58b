class SignupController < ApplicationController
  private
    # 許可するキーを設定します
    def user_params
      params.require(:user).permit(
        :email,
        :password,
        :password_confirmation,
        :nick_name,
        :family_name
        :family_kana
        :first_name,
        :first_kana,
        :birth_year,
        :birth_month,
        :birth_day,
        :phone_number
        :zip
        :prefecture_i
        :city,
        :block,
        :building,
        
        :last_name_kana,
        
        ~省略~
    )
    end
end
