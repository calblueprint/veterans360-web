class FriendshipsController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  # POST /veterans/1/friendships
  def create
    friend_id = friendship_params[:friend_id]
    veteran = Veteran.find(params[:veteran_id])
    @friendship = veteran.friendships.build(friend_id: friend_id)
    if @friendship.save
      render json: @friendship
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH /veterans/1/friendships/reject
  # Rejects a friend request sent to this veteran by
  # removing the corresponding friendship with params
  # veteran_id: <friend's id>, friend_id: <this veteran's id>
  def reject
    friend_id = friendship_params[:friend_id]
    @friendship = Friendship.find_by(
      veteran_id: friend_id,
      friend_id: params[:veteran_id]
    )
    if @friendship.destroy
      render json: @friendship
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(
      :friend_id,
    )
  end

end
