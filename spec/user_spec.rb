require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a family_name" do
      user = User.new(family_name: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end
  end
end