# tahapan
rails g scaffold course name:string
rails g scaffold student nim:string name:string git_repo:string account_git:string commits:integer code_commits:integer lines_added:integer lines_deleted:integer course:references

rails db:seed


# build image
docker build -t edutrack .

# container
docker run --name edutrack --cpus=2 --memory=2g -p 3000:3000 my-rails-app

