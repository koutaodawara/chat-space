class ChatsController < ApplicationController

before_action :find_group, only: [:index, :create]

  def index
    @groups = current_user.groups.includes(:users)
    @chat = Chat.new
  end

  def create
    chat = Chat.new(chat_params)
    if chat.save
      respond_to do |format|
        format.html { redirect_to group_chats_path(@group) }
        format.json { render json: chat.chat_json}
      end
    else
      redirect_to group_chats_path(@group), alert: '投稿に失敗しました'
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:text, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def find_group
      @group = Group.find(params[:group_id])
  end
end
