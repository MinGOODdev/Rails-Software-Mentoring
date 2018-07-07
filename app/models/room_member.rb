class RoomMember < ApplicationRecord
    belongs_to :mentor_room
    belongs_to :user
end
