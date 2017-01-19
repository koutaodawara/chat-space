class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(create_params)
    if group.save
      redirect_to root_path, notice: "グループを登録しました！"
    else
      redirect_to new_group_path,  alert: 'やりなおし〜'
    end
  end

  def edit
  end

  private
  def create_params
    params.require(:group).permit(:name)
    ##選択してきたuserをどのように保存するか。attributeを使って登録
  end
end
