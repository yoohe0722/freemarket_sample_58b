require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with a nick_name, email, password, password_confirmation, family_name, first_name, family_kana, first_kana, birth_year, birth_month, birth_day, phone_number, zip, prefecture_id, city, block" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nick_name" do
      user = build(:user, nick_name: nil)
      user.valid?
      expect(user.errors[:nick_name]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください", "は不正な値です")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください", "は不正な値です")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end
    
    it "is invalid without a family_name" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a family_kana" do
      user = build(:user, family_kana: nil)
      user.valid?
      expect(user.errors[:family_kana]).to include("を入力してください")
    end

    it "is invalid without a first_kana" do
      user = build(:user, first_kana: nil)
      user.valid?
      expect(user.errors[:first_kana]).to include("を入力してください")
    end
    
    it "is invalid without a birth_year" do
      user = build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end

    it "is invalid without a birth_month" do
      user = build(:user, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end

    it "is invalid without a birth_day" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end

    it "is invalid without a phone_number" do
      user = build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("を入力してください")
    end

    it "is invalid without a zip" do
      user = build(:user, zip: nil)
      user.valid?
      expect(user.errors[:zip]).to include("を入力してください")
    end

    it "is invalid without a prefecture_id" do
      user = build(:user, prefecture_id: nil)
      user.valid?
      expect(user.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without a city" do
      user = build(:user, city: nil)
      user.valid?
      expect(user.errors[:city]).to include("を入力してください")
    end

    it "is invalid without a block" do
      user = build(:user, block: nil)
      user.valid?
      expect(user.errors[:block]).to include("を入力してください")
    end

    it "is invalid with a nickname that has more than 21 characters " do
      user = build(:user, nick_name: "aaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nick_name][0]).to include("は20文字以内で入力してください")
    end

    it "is invalid with a nickname that has lsee than 20 characters " do
      user = build(:user, nick_name: "aaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "00000a", password_confirmation: "00000a")
      user.valid?
      expect(user.errors[:password][0]).to include("は不正な値です")
    end

    it "is invalid with a password that has more than 7 characters " do
      user = build(:user, password: "00000aa", password_confirmation: "00000aa")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a password that has more than 128 characters " do
      user = build(:user, password: "mMSNObCcHOdlashBdCrzt2NZdEmRdgljjAdfgUiVT7uwzOOatmDDcm6lsyXsS6xUzqUUyOUIpBUjFUz9AvJpZV0ARzdOZLAudHLIKMjYqYXYsrzvMpzOTcu9eOWSqU5La", password_confirmation: "mMSNObCcHOdlashBdCrzt2NZdEmRdgljjAdfgUiVT7uwzOOatmDDcm6lsyXsS6xUzqUUyOUIpBUjFUz9AvJpZV0ARzdOZLAudHLIKMjYqYXYsrzvMpzOTcu9eOWSqU5La")
      user.valid?
      expect(user.errors[:password][0]).to include("は128文字以内で入力してください")
    end
  end

  it "is invalid with a duplicate email address" do
    user = create(:user)
    another_user = build(:user)
    another_user.valid?
    expect(another_user.errors[:email]).to include("はすでに存在します")
  end

  it "is invalid password not included english characters" do
    user = build(:user, password: "0000000", password_confirmation: "00000000")
    user.valid?
    expect(user.errors[:password][0]).to include("は不正な値です")
  end

  it "is invalid password not included numbers" do
    user = build(:user, password: "aaaaaaa", password_confirmation: "aaaaaaa")
    user.valid?
    expect(user.errors[:password][0]).to include("は不正な値です")
  end

  it "is invalid email not included a dot" do
    user = build(:user, email: "aaa@aaa")
    user.valid?
    expect(user.errors[:email]).to include("は不正な値です")
  end

  it "is valid email include a dot" do
    user = build(:user, email: "aaa@aaa.com")
    user.valid?
    expect(user).to be_valid
  end

end