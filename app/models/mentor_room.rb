class MentorRoom < ApplicationRecord
    belongs_to :semester
    has_many :room_members
end
