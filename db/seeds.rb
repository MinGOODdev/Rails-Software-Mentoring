# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'mingooddev@1',
            password: '111111',
            student_number: '201132034',
            student_name: '조민국',
            bank_name: '국민',
            bank_account: '45700101290300',
            grade: '4',
            department_id: 11,
            authorization: 0)

Department.create(id: 10, department_name: 'IT학부')
Department.create(id: 11, department_name: '소프트웨어공학과')
Department.create(id: 12, department_name: '컴퓨터공학과')
Department.create(id: 13, department_name: '정보통신공학과')
Department.create(id: 14, department_name: '글로컬IT학과')

Semester.create(semester_name: '2018년 2학기')
Semester.create(semester_name: '2019년 1학기')
Semester.create(semester_name: '2019년 2학기')
Semester.create(semester_name: '2020년 1학기')
Semester.create(semester_name: '2020년 2학기')
