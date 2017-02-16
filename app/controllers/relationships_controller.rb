class RelationshipsController < ApplicationController

  def create
    user = User.find(current_user.id)
    user.active_relationships.create(follow_params)
    redirect_to root_path
  end

  def destroy

  end

private
def follow_params
  params.require(:relationship).permit(:followed_id)
end
end
