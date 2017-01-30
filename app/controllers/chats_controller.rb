class ChatsController < ApplicationController

before_action :find_group, only: [:index, :create]

  def index
    @groups = current_user.groups.includes(:users)
    @chat = Chat.new
  end

  def create
    chat = Chat.new(chat_params)
    respond_to do |format|
      if chat.save
        format.html {redirect_to group_chats_path(@group)}
        format.json {render json: {chat: {text: @chat.text}}}
      else
        format.html {redirect_to group_chats_path(@group), alert: '投稿に失敗しました'}
        format.json {render json: {message: {text: @message.text}}}
      end
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:text).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def find_group
      @group = Group.find(params[:group_id])
  end
end
