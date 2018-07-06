# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'mingooddev@1',
            password: '111111',
            studentNumber: '201132034',
            studentName: '조민국',
            bankName: '국민',
            bankAccount: '45700101290300',
            grade: '4',
            departmentId: 11,
            authorization: 0)

Department.create(id: 10, departmentName: 'IT학부')
Department.create(id: 11, departmentName: '소프트웨어공학과')
Department.create(id: 12, departmentName: '컴퓨터공학과')
Department.create(id: 13, departmentName: '정보통신공학과')
Department.create(id: 14, departmentName: '글로컬IT학과')