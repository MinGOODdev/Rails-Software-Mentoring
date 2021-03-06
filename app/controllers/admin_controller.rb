class AdminController < ApplicationController

  # 멘토링 기간이 종료되면 제출된 보고서는 보존하고,
  # MentorApply, MentorRoom, RoomMember, 요일별 테이블을 모두 비운다.
  def mentoringEnd
    MentorApply.destroy_all
    MentorRoom.destroy_all
    Monday.destroy_all
    Tuesday.destroy_all
    Wednesday.destroy_all
    Thursday.destroy_all
    Friday.destroy_all

    ## 관리자 권한을 제외하고 모두 권한 '2'로 Reinitialization
    users = User.all
    users.each do |u|
      if u.authorization != '0'
        u.authorization = '2'
        u.save
      end
    end

    redirect_to '/home/index'
  end

  # AdminOption 관리
  def adminOptionGet
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
    @users = User.all.page params[:page]
    @userAll = User.all

    ## export
    respond_to do |format|
      format.html
      format.xlsx
      format.csv { send_data @userAll.to_csv }
      format.xls
    end
  end
  
  # 멘토 신청자 목록 조회
  def mentorApplyUsers
    @mentorApplies = MentorApply.all.page params[:page]
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
      ## 관리자는 그대로 권한을 유지하기 위함
      ## TODO 학생회장이 관리자, 학번 계정 2개를 가진다면 이 부분은 사실상 필요 없음.
      if u.authorization == '2'
        u.authorization = '1'
      end
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
    @semesters = Semester.order("created_at DESC").page params[:page]
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
    User.import(params[:file])
    redirect_to '/admin/findAllUsers'
  end

  ## TODO Modify: 비밀번호에 폰번호 + 문자열 들어가게 할 수 있겠지 ?

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
