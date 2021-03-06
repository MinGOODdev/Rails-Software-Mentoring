class MentorsController < ApplicationController
  
  # 내 멘토방 해당 멘티 삭제
  def deleteMyMentee
    roomMember = RoomMember.find_by(:user_id => params[:user_id])
    roomMember.destroy
    redirect_to '/students/myMentorRoom'
  end

  # 중간 보고서 제출
  def midReportUpdate
    mentorRoom = MentorRoom.find_by(:user_id => current_user.id)

    ## 보고서를 업로드하지 않고 버튼을 누를 경우
    if params[:attachment] == nil
      flash[:danger] = '업로드할 파일을 선택해주세요.'
      redirect_to '/students/myMentorRoom' and return
    end

    if MidReport.find_by(:user_id => current_user.id,
                         :semester_id => mentorRoom.semester_id,
                         :mentor_room_id => mentorRoom.id) == nil
      midReport = MidReport.new
      midReport.user_id = current_user.id
      midReport.semester_id = mentorRoom.semester_id
      midReport.mentor_room_id = mentorRoom.id
      ## 파일 업로드
      uploader = AttachmentUploader.new
      uploader.store!(params[:attachment])
      midReport.attachment = uploader.url

      midReport.save

      redirect_to '/students/myMentorRoom'
    else
      midReport = MidReport.find_by(:user_id => current_user.id,
                                    :semester_id => mentorRoom.semester_id,
                                    :mentor_room_id => mentorRoom.id)
      ## 파일 업로드
      uploader = AttachmentUploader.new
      uploader.store!(params[:attachment])
      midReport.attachment = uploader.url

      midReport.save

      redirect_to '/students/myMentorRoom'
    end
  end

  # 최종 보고서 제출
  def finalReportUpdate
    mentorRoom = MentorRoom.find_by(:user_id => current_user.id)

    ## 보고서를 업로드하지 않고 버튼을 누를 경우
    if params[:attachment] == nil
      flash[:danger] = '업로드할 파일을 선택해주세요.'
      redirect_to '/students/myMentorRoom' and return
    end

    if FinalReport.find_by(:user_id => current_user.id,
                           :semester_id => mentorRoom.semester_id,
                           :mentor_room_id => mentorRoom.id) == nil
      finalReport = FinalReport.new
      finalReport.user_id = current_user.id
      finalReport.semester_id = mentorRoom.semester_id
      finalReport.mentor_room_id = mentorRoom.id
      ## 파일 업로드
      uploader = AttachmentUploader.new
      uploader.store!(params[:attachment])
      finalReport.attachment = uploader.url

      finalReport.save

      redirect_to '/students/myMentorRoom'
    else
      finalReport = FinalReport.find_by(:user_id => current_user.id,
                                        :semester_id => mentorRoom.semester_id,
                                        :mentor_room_id => mentorRoom.id)
      ## 파일 업로드
      uploader = AttachmentUploader.new
      uploader.store!(params[:attachment])
      finalReport.attachment = uploader.url

      finalReport.save

      redirect_to '/students/myMentorRoom'
    end
  end
  
end
