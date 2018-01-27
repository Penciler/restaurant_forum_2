class Friendship < ApplicationRecord
  validates :friend_id, uniqueness: { scope: :user_id }
  belongs_to :user
  belongs_to :friendship, class_name: "User"
end
