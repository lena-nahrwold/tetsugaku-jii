namespace :dictionary_entries do
  desc "Load dictionary entries"
  task :load => :environment do
    LoadMainEntriesToDbService.perform
    LoadSubEntriesToDbService.perform
  end
end
