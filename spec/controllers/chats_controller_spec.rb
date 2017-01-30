require 'rails_helper'
describe ChatsController do
  let!(:chat_params){{
    text: "サンプル"
  }}


  describe '#index' do
    # it 'is assign @groups' do
    #   groups = 全部を作り出すメソッド
    #   expect(:groups).全部を取り出すメソッド = groups
    #   end

      it "is assing @group" do
        get group_chats_path(group_id: 1)
        expect(assigns(:group)).to eq group
      end
    end


  describe 'GET #index' do
    it "assigns @chat" do
      get :index
      expect(assigns(:group)).to eq group
    end
  end

   describe 'GET #index' do
    it "renders the chat.group template" do
      get :index
      expect(response).to render_template :index
    end
  end

end
