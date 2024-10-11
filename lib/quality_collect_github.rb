class QualityGitHubStatsCollector
  VALID_EXTENSIONS = %w[.rb .py .php .go .mod .rake .js .json .css .sqlite3 .yml .conf .md]
  def initialize(access_token)
    @client = Octokit::Client.new(access_token: access_token)
  end

  def collect_only_code(repo, account_gits)
    
  end

  def collect_stats(repo, account_gits)
    start_date = Date.today - 120
    end_date = Date.today
    stats = {}

    account_gits.each do |account|
      puts "Collecting data for #{account}"
      stats[account] = {
        commits: 0,
        additions: 0,
        deletions: 0
      }

      commits = @client.commits_between(repo, start_date, end_date, author: account)
      stats[account][:commits] = commits.length

      commits.each do |commit|
        detailed_commit = @client.commit(repo, commit.sha)
        process_commit_files(detailed_commit, stats[account])
      end
    end

    stats
  end

  private

  def process_commit_files(detail_commits, account_stats)
    detail_commits.files.each do |dc|
      next unless valid_file_type?(dc.filename)

      account_stats[:additions] += file.additions
      account_stats[:deletions] += file.deletions
    end
  end

  def valid_file_type?(filename)
    VALID_EXTENSIONS.any? { |ext| filename.end_with?(ext) }
  end
end