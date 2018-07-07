class MentorsController < ApplicationController
  
  # 멘토 신청 (Get)
  def applyGet
    @semesters = Semester.all
  end
  
  # 멘토 신청 (Post)
  def applyPost
    apply = MentorApply.new
    apply.user_id = current_user.id
    apply.semester_id = params[:semester_id]
    apply.team_name = params[:team_name]
    apply.subject = params[:subject]
    apply.purpose = params[:purpose]
    apply.content = params[:content]
    apply.method = params[:method]
    apply.save
  end
  
end
