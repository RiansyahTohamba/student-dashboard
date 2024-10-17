require 'dotenv/rails'

def  init_course_admin
  p "init seed for admin "

  AdminUser.create!(email: 'admin@uho.ac.id', password: ENV['admin_password'], password_confirmation: ENV['admin_password'])
  muhriansyah = AdminUser.create!(email: 'muh.riansyaht@uho.ac.id', password: ENV['admin_password'], password_confirmation: ENV['admin_password'])
  mriansyah = AdminUser.create!(email: 'mriansyah@uho.ac.id', password: ENV['admin_password'], password_confirmation: ENV['admin_password'])
  # p 'init seed for course'
  # Course.create!(name: 'Komputasi Paralel & Terdistribusi',user_id: muhriansyah.id)
  # Course.create!(name: 'Sistem Operasi',user_id: mriansyah.id)
end


def read_csv(csv_file, course_id)
  CSV.foreach(csv_file, headers: true, col_sep: ';') do |row|
    st = Student.find_or_create_by(name: row['name'])
    st.nim = row['nim']
    st.name = row['name']
    st.git_repo = row['git_repo']
    st.account_git = row['account_git']
    st.commits = row['commits']
    st.code_commits = row['code_commits']
    st.lines_added = row['line_added']
    st.lines_deleted = row['line_deleted']
    st.course_id = course_id
    st.save!
    p "#{row['name']} has been inserted"
  end
  p "successfully insert #{csv_file} to DB"
end

def main()
  init_course_admin
  # paralel_course = Course.where(name: 'Komputasi Paralel & Terdistribusi').first
  # read_csv('./db/data/paralel_students.csv',paralel_course.id)  
  # os_course = Course.where(name: 'Sistem Operasi').first
  # read_csv('./db/data/os_students.csv',os_course.id)  
end

main()

