class FriendRequest < ApplicationRecord
  belongs_to :requestor, class_name: :User
  belongs_to :receiver, class_name: :User

  def self.requests_for(user_id)
    where("receiver_id = :id OR requestor_id = :id", id: user_id)
  end
end
