# tahapan
rails g scaffold course name:string
rails g scaffold student nim:string name:string git_repo:string account_git:string commits:integer code_commits:integer lines_added:integer lines_deleted:integer course:references

rails db:seed