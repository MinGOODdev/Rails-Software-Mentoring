class Semester < ApplicationRecord
    # has_many :mid_reports
    # has_many :final_reports
    has_many :mentor_applies
    has_many :mentor_rooms
end
