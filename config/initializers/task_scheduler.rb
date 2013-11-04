require 'rufus/scheduler'

scheduler = Rufus::Scheduler.new
scheduler.every "1h", :first_at => Time.now + 60 do
  JokeCrawler.new({all:false}).run
end
