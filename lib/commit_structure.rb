access_token = ENV['GITHUB_TOKEN']
@client = Octokit::Client.new(access_token: access_token)
start_date = Date.today - 120
end_date = Date.today

repo = 'ilhamarief0/ilkom-22-pararel-1'
account = 'ilhamarief0'


commits = @client.commits_between(repo, start_date, end_date, author: account)
commit = commits[0]
detailed_commit = @client.commit(repo, commit.sha)
dc = detailed_commit[:files][0]
filename = dc[:filename]
VALID_EXTENSIONS = %w[.rb .py .php .go .mod .rake .js .json .css .sqlite3 .yml .conf .md]
def valid_file_type?(filename)
  VALID_EXTENSIONS.any? { |ext| filename.end_with?(ext) }
end
valid_file_type?(filename)
# process_commit_files(detailed_commit, stats[account])