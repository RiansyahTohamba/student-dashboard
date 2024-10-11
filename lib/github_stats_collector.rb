require 'dotenv-rails'
Dotenv.load
class GitHubStatsCollector
  def initialize(access_token)
    @client = Octokit::Client.new(access_token: access_token)
  end

  def collect_stats(repo, account_gits)
    # last 30 days
    start_date = Date.today - 120 
    end_date = Date.today
    stats = {}
    account_gits.each do |account|
      p "collecting data #{account}"
      stats[account] = {
        commits: 0,
        additions: 0,
        deletions: 0
      }

      # Get commit activity for the specific student
      commits = @client.commits_between(repo, start_date, end_date, author: account)
      stats[account][:commits] = commits.length

      # Get detailed stats for each commit
      commits.each do |commit|
        detailed_commit = @client.commit(repo, commit.sha)
        stats[account][:additions] += detailed_commit.stats.additions
        stats[account][:deletions] += detailed_commit.stats.deletions
      end
    end

    stats
  end
end

def do_collecting(repos)
  collector = GitHubStatsCollector.new(ENV['GITHUB_TOKEN'])
  repos.map do |rp|
    account_gits = Student.where(git_repo: rp).select(:account_git).map{|s| s[:account_git]}
    stats = collector.collect_stats(rp, account_gits)
  
    stats.each do |account, user_stats|
      Student.where(account_git: account).update(commits: user_stats[:commits],lines_added: user_stats[:additions],lines_deleted:user_stats[:deletions])
      puts "updating data for #{account}, stats: (#{user_stats}})"    
    end  
  end  
end
