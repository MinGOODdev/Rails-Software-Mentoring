class MentorApply < ApplicationRecord
  paginates_per 10
  belongs_to :semester
  belongs_to :user
end
