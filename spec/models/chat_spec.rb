require 'rails_helper'

describe Chat do
  let(:user){create(:user)}
  let(:group){create(:group)}
  let(:chat){create(:chat, user: user, group: group)}

  describe '#create' do
    it "is valid with a text" do
      chat = build(:chat)
      expect(chat).to be_valid
    end

      it "is invalid without a text " do
      chat = build(:chat, text: '')
      chat.valid?
      expect(chat.errors[:text]).to include("can't be blank")
    end
  end
end
