# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'http://joke.realityandapp.com/'

SitemapGenerator::Sitemap.create do
  Joke.tags_english_names.each do |tag|
    send(:add, send(tag + "_path"), changefreq: 'always', priority: 0.9)
  end
  #add image_path, changefreq: 'always', priority: 0.9
  #add video_path, changefreq: 'always', priority: 0.9
  #add long_path, changefreq: 'always', priority: 0.9
  #add short_path, changefreq: 'always', priority: 0.9

  Joke.all.each do |c|
    add joke_path(c), lastmod: c.updated_at, priority:  0.8#, data: ''#, display: ''
  end

  Joke.tags.each do |tag|
    send(:add, send("tag_path", tag), changefreq: 'always', priority: 0.7)
  end

  (0..(Joke.count / 1000)).to_a.each do |c|
    add sitemap_pages_path(page: c + 1), lastmod: 'daily', priority:  0.6#, data: ''#, display: ''
  end
end
