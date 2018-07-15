class AdminController < ApplicationController

  # TODO Feature: Admin
  # 멘토링 기간이 종료되면 제출된 보고서는 보존하고,
  # MentorApply, MentorRoom, RoomMember, 요일별 테이블을 모두 비운다.
  def mentoringEnd
    # mentorApplies = MentorApply.all
    # mentorRooms = MentorRoom.all
    # roomMembers = RoomMember.all
    # mondays = Monday.all
    # tuesdays = Tuesday.all
    # wednesdays = Wednesday.all
    # thursdays = Thursday.all
    # fridays = Friday.all

    # MentorApply.destroy_all
    # MentorRoom.destroy_all
    # RoomMember.destroy_all
    # Monday.destroy_all
    # Tuesday.destroy_all
    # Wednesday.destroy_all
    # Thursday.destroy_all
    # Friday.destroy_all

    # 테이블 세부 관계 설정하면 조금 더 간략해질 것 같다.

    redirect_to 'home/index'
  end

  # AdminOption 관리
  def adminOptionGet
    size = AdminOption.all.size
    if size == 0
      adminOption = AdminOption.new
      adminOption.mentor_apply_active = 0
      adminOption.mentee_apply_active = 0
      adminOption.room_member_max_num = 6
      adminOption.save
    end
    @adminOption = AdminOption.first
  end

  # 멘토 신청 버튼 활성화/비활성화
  def mentorOption
    adminOption = AdminOption.first
    if adminOption.mentor_apply_active == 1
      adminOption.mentor_apply_active = 0
      adminOption.save
    elsif adminOption.mentor_apply_active == 0
      adminOption.mentor_apply_active = 1
      adminOption.save
    end
    redirect_to '/admin/adminOptionGet'
  end
  
  # 멘티 신청 활성화/비활성화
  def menteeOption
    adminOption = AdminOption.first
    if adminOption.mentee_apply_active == 1
      adminOption.mentee_apply_active = 0
      adminOption.save
    elsif adminOption.mentee_apply_active == 0
      adminOption.mentee_apply_active = 1
      adminOption.save
    end
    redirect_to '/admin/adminOptionGet'
  end

  # 멘토방 인원 설정
  def roomOption
    adminOption = AdminOption.first
    adminOption.room_member_max_num = params[:room_member_max_num]
    adminOption.save
    redirect_to '/admin/adminOptionGet'
  end
  
  # 전체 유저 목록 조회
  def findAllUsers
    @users = User.all
  end
  
  # 멘토 신청자 목록 조회
  def mentorApplyUsers
    @mentorApplies = MentorApply.all
  end
  
  # 멘토 신청자 세부 정보 조회
  def mentorApplyFindOne
    @mentorApply = MentorApply.find(params[:mentor_apply_id])
  end

  # 멘토 신청자 신청 내역 삭제
  def deleteMentorApply
    mentorApply = MentorApply.find(params[:mentor_apply_id])
    mentorApply.destroy

    redirect_to '/admin/mentorApplyUsers'
  end
  
  # 멘토 신청 승인 (신청자 권한 멘토로 변경)
  def mentorApplyConfirm
    # 멘토 권한 승인
    users = User.find(params[:users])
    users.each do |u|
      u.authorization = 1
      u.save
    end
    
    # 멘토방 개설
    users.each do |u|
      mentorApply = MentorApply.find_by(:user_id => u.id)
      ## 해당 유저의 멘토방이 없다면 개설
      if MentorRoom.find_by(:user_id => u.id) == nil
        mentorRoom = MentorRoom.new
        mentorRoom.user_id = mentorApply.user_id
        mentorRoom.team_name = mentorApply.team_name
        mentorRoom.subject = mentorApply.subject
        mentorRoom.purpose = mentorApply.purpose
        mentorRoom.content = mentorApply.content
        mentorRoom.method = mentorApply.method
        mentorRoom.semester_id = mentorApply.semester_id
        mentorRoom.attachment = mentorApply.attachment
        mentorRoom.save
        
        ## RoomMember Table에도 저장
        roomMember = RoomMember.new
        roomMember.user_id = mentorApply.user_id
        roomMember.mentor_room_id = mentorRoom.id
        roomMember.save

        ## 멘토 시간표 초기화
        monday = Monday.new
        tuesday = Tuesday.new
        wednesday = Wednesday.new
        thursday = Thursday.new
        friday = Friday.new
        initialize_mentor_time_table(monday, mentorApply)
        initialize_mentor_time_table(tuesday, mentorApply)
        initialize_mentor_time_table(wednesday, mentorApply)
        initialize_mentor_time_table(thursday, mentorApply)
        initialize_mentor_time_table(friday, mentorApply)
      end
    end

    redirect_to '/admin/mentorApplyUsers'
  end

  # 멘토방 삭제
  def mentorRoomDelete
    mentorRoom = MentorRoom.find(params[:mentor_room_id])
    mentorRoom.destroy
    redirect_to '/students/findAllRooms'
  end
  
  # 유저 권한 변경
  def userAuthChange
    user = User.all
    user.each do |u|
      u.authorization = params[(u.id).to_s]
      u.save
    end

    redirect_to '/admin/findAllUsers'
  end
  
  # 유저 삭제
  def userDelete
    user = User.find(params[:user_id])
    user.destroy
    redirect_to '/admin/findAllUsers'
  end

  # 학기 관리 (Get)
  def semesterGet
    @semesters = Semester.all.reverse
  end

  # 학기 등록 (Post)
  def semesterCreate
    semester = Semester.new
    semester.semester_name = params[:semester_name]
    semester.save

    redirect_to '/admin/semesterGet'
  end

  # 학기 상태 변경
  def semesterUpdate
    semester = Semester.find(params[:semester_id])
    if semester.semester_able == true
      semester.semester_able = false
    elsif semester.semester_able == false
      semester.semester_able = true
    end
    semester.save

    redirect_to '/admin/semesterGet'
  end

  # 학기 삭제
  def semesterDelete
    semester = Semester.find(params[:semester_id])
    semester.destroy
    redirect_to '/admin/semesterGet'
  end

  # 전체 보고서 조회
  def reportAll
    @midReports = MidReport.all
    @finalReports = FinalReport.all
  end

  ## 사용자 csv, xls, xlsx 업로드
  def import
    count = User.import(params[:file])
    redirect_to '/admin/findAllUsers', notice: "#{count}!"
  end

  private
  def initialize_mentor_time_table(day, mentorApply)
    day.user_id = mentorApply.user.id
    day.am_nine_to_ten = 0
    day.am_ten_to_eleven = 0
    day.am_eleven_to_twelve = 0
    day.pm_twelve_to_one = 0
    day.pm_one_to_two = 0
    day.pm_two_to_three = 0
    day.pm_three_to_four = 0
    day.pm_four_to_five = 0
    day.pm_five_to_six = 0
    day.pm_six_to_seven = 0
    day.pm_seven_to_eight = 0
    day.pm_eight_to_nine = 0
    day.pm_nine_to_ten = 0
    day.save
  end
  
end
