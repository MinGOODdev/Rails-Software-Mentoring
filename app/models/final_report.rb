class FinalReport < ApplicationRecord
  belongs_to :user
  belongs_to :mentor_room
  belongs_to :semester
end
