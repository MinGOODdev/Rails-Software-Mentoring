class MentorRoom < ApplicationRecord
    belongs_to :semester
    belongs_to :user
    has_many :room_members, dependent: :destroy
end
