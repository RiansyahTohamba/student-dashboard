require_relative '../github_stats_collector'


namespace :git_sync do
  desc "Sync DB with commit data from PARALEL github"
  task paralel_commit: :environment do
    puts "Menjalankan sync PARALEL commit task"
    repos = ['ilhamarief0/ilkom-22-pararel-1','zu0909/ilkom-22-paralel-2',
    'mh1225az/ilkom22-pararel-3',
    'andinajwa/ilkom-22-Kelompok-4',
    'iceblessedtea/ilkom22-paralel-5',
    'aooneoow/ilkom-22-paralel-7','fryzkaamlya/ilkom-22-pararel-kelompok-6']
    do_collecting(repos)
  end

  desc "Sync DB with commit data from OS github"
  task os_commit: :environment do
    puts "Menjalankan sync OS commit task"
    repos = ['Syahrrulll/ilkom-23-os-kelompok-1',
      'arilandrian/ilkom-23-os-kelompok-2',
      'IqraJr/ilkom-23-kelompok-os-3',
      'Adamachmad/ilkom-23-os-kelompok-4',
      'gstkrsnaprnta/ilkom23-os-kelompok-5',
      'sains855/ilkom-23-os-kelompok-6',
      'kurapika12/ilkom-23-os-kelompok-7',
      'prasdionaditya/ilkom-23-os-kelompok-8'
    ]
    do_collecting(repos)
  end
end
