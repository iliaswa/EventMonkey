require_relative "app/models/event"

desc "This task is called by the Heroku scheduler add-on"
task :update_events => :environment do
  puts "Updating events..."
  Event.api
  puts "done."
end
