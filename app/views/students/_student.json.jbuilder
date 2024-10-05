json.extract! student, :id, :nim, :name, :git_repo, :account_git, :commits, :code_commits, :lines_added, :lines_deleted, :course_id, :created_at, :updated_at
json.url student_url(student, format: :json)
