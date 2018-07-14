# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'admin', password: '111111',
            student_name: '관리자', grade: '4', phone_number: '010-0000-0000',
            mail: 'admin@admin', bank_name: '국민', bank_account: '45700101290300',
            department_id: 10, authorization: 0)

User.create(email: '201132034', password: '111111',
            student_name: '조민국', grade: '4', phone_number: '010-0000-0000',
            mail: '1@1', bank_name: '국민', bank_account: '45700101290300',
            department_id: 11, authorization: 2)
            
User.create(email: '201132001', password: '111111',
            student_name: '프로도', grade: '4', phone_number: '010-0000-0000',
            mail: 'kakao@kakao', bank_name: 'kakao', bank_account: '45700101290300',
            department_id: 12, authorization: 2)

User.create(email: '201132002', password: '111111',
            student_name: '나얼', grade: '4', phone_number: '010-0000-0000',
            mail: 'BES@bes', bank_name: 'bes', bank_account: '45700101290300',
            department_id: 13, authorization: 2)
            
Department.create(id: 10, department_name: 'IT학부')
Department.create(id: 11, department_name: '소프트웨어공학과')
Department.create(id: 12, department_name: '컴퓨터공학과')
Department.create(id: 13, department_name: '정보통신공학과')
Department.create(id: 14, department_name: '글로컬IT학과')

Semester.create(semester_name: '2018년 2학기', semester_able: false)
Semester.create(semester_name: '2019년 1학기')
Semester.create(semester_name: '2019년 2학기')
Semester.create(semester_name: '2020년 1학기')
Semester.create(semester_name: '2020년 2학기')

for x in 1..20
  Notice.create(user_id: 1, title: "#{x}번째 공지글", content: "#{x}번째 공지글 내용")
end
