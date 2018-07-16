class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  paginates_per 10
  belongs_to :department
  has_many :notices
  has_many :questions

  # 사용자 Import (csv, xls, xlsx)
  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      user = User.find_by(id: row["id"]) || User.new
      user.attributes = row.to_hash
      user.save!
    end
  end

  # 사용자 Export .xls
  def self.to_csv(options = {})
    desired_columns = ["email", "student_name", "grade", "phone_number", "mail", "department_id"]
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |user|
        csv << user.attributes.values_at(*desired_columns)
      end
    end
  end

end
