class ChatsController < ApplicationController

  def index
    @groups = Group.all
    @group = Group.find(params[:group_id])
    @chat = Chat.new
  end

  def create
    chat = Chat.new(chat_params)
    if chat.save
      redirect_to :back, notice: '投稿しました'
    else
      redirect_to :back, alert: '投稿に失敗しました。'
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:text).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
