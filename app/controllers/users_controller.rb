class UsersController < ApplicationController

  def index
    @users_except_current_user = User.where('name LIKE(?)', "#{params[:input]}%")
    respond_to do |format|
      format.html{ redirect_to users_path }
      format.json{ render json:  @users_except_current_user }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def followed
    @user = User.find(params[:id])
    @users = @user.followed
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.follower
  end
end
