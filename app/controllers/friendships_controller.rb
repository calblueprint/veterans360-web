class FriendshipsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    veteran_id = friendship_params[:veteran_id]
    friend_id = friendship_params[:friend_id]
    veteran = Veteran.find(veteran_id)
    @friendship = veteran.friendships.build(friend_id: friend_id)
    if @friendship.save
      render json: @friendship
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(
      :veteran_id,
      :friend_id,
    )
  end

end
