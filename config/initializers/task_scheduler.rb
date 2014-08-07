require 'rufus/scheduler'

scheduler = Rufus::Scheduler.new
scheduler.every "13m", :first_at => Time.now + 600 do
  JokeCrawler.new({all:false}).run
end
scheduler.every "59m", :first_at => Time.now + 660 do
  QingsongCrawler.new.run
end
scheduler.every "53m", :first_at => Time.now + 720 do
  QiushibaikeCrawler.new.run
end
scheduler.every "47m", :first_at => Time.now + 780 do
  BaozoumanhuaCrawler.new.run
end

scheduler.every "1d", first_at: '1h' do
  verbose = if SitemapGenerator::Utilities.truthy?(ENV['VERBOSE'])
              true
            elsif SitemapGenerator::Utilities.falsy?(ENV['VERBOSE'])
              false
            else
              nil
            end
  SitemapGenerator::Interpreter.run(:config_file => ENV["CONFIG_FILE"], :verbose => verbose)
  SitemapGenerator::Sitemap.ping_search_engines if Rails.env.production?
end
