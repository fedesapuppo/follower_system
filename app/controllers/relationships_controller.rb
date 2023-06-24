class RelationshipsController < ApplicationController
    def create
      other_user = User.find(params[:user_id])
      @rel = Relationship.new(follower_id: current_user.id, followed_id: other_user.id)
  
      if @rel.save
        redirect_to user_path(other_user), notice: 'You are now following this user.'
      else
        redirect_to user_path(other_user), alert: 'Failed to follow this user.'
      end
    end
  
    def destroy
      @rel = Relationship.find(params[:id])
      other_user = @rel.followed
      @rel.destroy
  
      redirect_to user_path(other_user), notice: 'You have unfollowed this user.'
    end
  end
  