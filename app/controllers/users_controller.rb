class UsersController < ApplicationController

  def index
    @users_except_current_user = User.where('name LIKE(?)', "#{params[:query]}%").where.not(id: current_user.id)
    users_except_current_user = users.where.not(name: current_user.name)
    respond_to do |format|
      format.html{ redirect_to users_path }
      format.json{ render json: @users_expect_current_user }
    end
  end
end
