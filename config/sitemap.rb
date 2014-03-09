# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'http://joke.realityandapp.com/'

SitemapGenerator::Sitemap.create do
  Joke.all.each do |c|
    add joke_path(c), lastmod: c.updated_at, :priority => 1
  end

  add image_path, :changefreq => 'daily', :priority => 0.9
  add video_path, :changefreq => 'daily', :priority => 0.9
  add long_path, :changefreq => 'daily', :priority => 0.8
  add short_path, :changefreq => 'daily', :priority => 0.8
end
