class GroupsController < ApplicationController

  before_action :authenticate_user!
  before_action :group_find, only: %i(show edit update destroy)

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to group_chats_path(@group.id), notice: 'グループを投稿しました'
    else
      redirect_to new_group_path, alert: '投稿に失敗しました'
    end
  end

  def edit
    @users = @group.users
  end

  def update
    if @group.update(group_params)
      redirect_to group_chats_path(@group.id), notice: 'グループを更新しました'
    else
      redirect_to edit_group_path, alert: 'もう一度編集してください'
    end
  end


  def destroy
    @group.destroy
    redirect_to root_path, notice: '削除に成功しました'
  end

  private
  def group_params
   params.require(:group).permit(:name, :user_ids=>[])
  end

  def group_find
    @group = Group.find(params[:id])
  end
end
