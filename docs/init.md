# tahapan
rails g scaffold course name:string
rails g scaffold student nim:string name:string git_repo:string account_git:string commits:integer code_commits:integer lines_added:integer lines_deleted:integer course:references

# create admin user
rails c
AdminUser.create!(email: 'admin@uho.ac.id', password: 'ceknilai', password_confirmation: 'ceknilai')

# create course