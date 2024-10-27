require 'dotenv/rails'

def  init_course_admin
  p "init seed for admin #{ENV['admin_password']}"
  muhriansyah = User.create!(
    email: 'muh.riansyaht@uho.ac.id',
    username: 'Muhammad Riansyah Tohamba',
    password: "#{ENV['admin_password']}",
    password_confirmation: "#{ENV['admin_password']}"
  )
  mriansyah = User.create!(
    email: 'mriansyah93@uho.ac.id',
    username: 'La Bionda Tohamba',
    password: "#{ENV['admin_password']}",
    password_confirmation: "#{ENV['admin_password']}"
  )
  
  paralel = Course.new(name: 'Komputasi Paralel & Terdistribusi')
  paralel.user = muhriansyah
  paralel.save!
  os = Course.new(name: 'Sistem Operasi')
  os.user = mriansyah
  os.save!
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
  # init_course_admin
  paralel_course = Course.where(name: 'Komputasi Paralel & Terdistribusi').first
  read_csv('./db/data/paralel_students.csv',paralel_course.id)  
  os_course = Course.where(name: 'Sistem Operasi').first
  read_csv('./db/data/os_students.csv',os_course.id)  
end

main()

