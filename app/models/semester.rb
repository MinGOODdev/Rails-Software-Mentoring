class Semester < ApplicationRecord
  paginates_per 5
  has_many :mid_reports
  has_many :final_reports
  has_many :mentor_applies
  has_many :mentor_rooms
end
