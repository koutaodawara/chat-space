require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

      it "is invalid without a password " do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

      it "is invalid without a nickname" do
        user = build(:user, name: "")
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end

      it "is invalid without a email" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "is invalid without confirm, if passward is" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "is invalid name by 6 letters" do
        user = build(:user, name: "ohaoha")
        expect(user).to be_valid
      end

      it "is valid nickname by 7 letters" do
        user = build(:user, name: "ohaohaoha")
        user.valid?
        expect(user.errors[:name]).to include("is too long (maximum is 6 characters)")
      end
  end
end
