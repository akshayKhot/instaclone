class FriendRequestsController < ApplicationController
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index

  end

  def add_friend
    FriendRequest.create(
      requestor_id: current_user.id,
      receiver_id: params[:to],
      status: "pending"
    )

    @receiver = User.find(params[:to])
  end

  def accept
    @requestor = User.find(params[:from])
    pending_friend_request = FriendRequest.find_by(requestor_id: @requestor.id, receiver_id: current_user.id)
    pending_friend_request.update(status: "accepted")
  end

  def decline
  end

  def pending
    @pending_friend_requests = FriendRequest.where(receiver_id: current_user.id, status: "pending")
  end

  def friends
    successful_friend_requests = FriendRequest.requests_for(current_user.id).where(status: 'accepted')
    friend_ids = successful_friend_requests.collect(&:requestor_id)
    friend_ids << successful_friend_requests.collect(&:receiver_id)
    friend_ids = friend_ids.flatten.uniq - [current_user.id]
    @friends = User.find(friend_ids)
  end
end
