require 'rufus/scheduler'

scheduler = Rufus::Scheduler.new
scheduler.every "1h", :first_at => Time.now + 60 do
  JokeCrawler.new({all:false}).run
  QingsongCrawler.new.run
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
