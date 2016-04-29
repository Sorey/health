namespace :create_search_indexes do
  task :create_solr_indexes => :environment do
    Sunspot.index(Admin::News.all)
    Sunspot.index(Admin::Video.all)

    puts "Solr Indexes Created"
  end
end
