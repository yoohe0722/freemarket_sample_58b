require 'rails_helper'

describe Item do
  describe '#create' do
    it "is valid with a name, email, price, description, condition_id, user_id, buyer_id, size_id, category_id, brand_id, prefecture_id, shipfee_id, shipmethod_id, shipdate_id, trading_condition" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "is invalid without a description" do
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include("を入力してください")
    end

    it "is invalid without a category_id" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without a shipdate_id" do
      item = build(:item, shipdate_id: nil)
      item.valid?
      expect(item.errors[:shipdate_id]).to include("を入力してください")
    end

    it "is invalid without a shipfee_id" do
      item = build(:item, shipfee_id: nil)
      item.valid?
      expect(item.errors[:shipfee_id]).to include("を入力してください")
    end

    it "is invalid without a shipmethod_id" do
      item = build(:item, shipmethod_id: nil)
      item.valid?
      expect(item.errors[:shipmethod_id]).to include("を入力してください")
    end

    it "is invalid without a user_id" do
      item = build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user_id]).to include("を入力してください")
    end

    it "is invalid with a name that has less than 40 characters" do
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:name][0]).to include("は40文字以内で入力してください")
    end

    it "is invalid with a description that has less than 100 characters" do
      item = build(:item, description: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:description][0]).to include("は100文字以内で入力してください")
    end

    it "is invalid with a description that has more than 300 characters" do
      item = build(:item, price: "200")
      item.valid?
      expect(item.errors[:price][0]).to include("は300以上の値にしてください")
    end

    it "is invalid with a description that has less than 99999999 characters" do
      item = build(:item, price: "10000000000000")
      item.valid?
      expect(item.errors[:price][0]).to include("は99999999以下の値にしてください")
    end
  end
end