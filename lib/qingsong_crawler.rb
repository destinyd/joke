require 'open-uri'

class QingsongCrawler
  def initialize(args={})
  end

  def run
    get_recent
  end

  def rss_url
    'http://www.17qingsong.com/rss'
  end

  def get_cotent(url)
    begin
      open(url).read.gsub('http://17qs.qiniudn.com/img/grey.gif','/assets/loading_bar.gif').match(regex_wrap)['content']
    rescue Exception => ex
      p 'QingsongCrawler get error:' + url
    end
  end

  def get_rss
    rss = Nokogiri::XML(open(rss_url))
  end

  def get_recent
    get_rss.xpath('//item').each do |item|
      joke_id =  item.xpath('guid').text
      unless Joke.where(joke_id: joke_id).first
        name = item.xpath('title').text
        link = item.xpath('link').text
        Joke.create joke_id: joke_id, name: name, text: get_cotent(link), tag_list: '长篇,轻松'
      end
    end
  end

  def regex_wrap
    @regex_wrap ||= /<div class="news-content.*?">(?<content>.*?)<\/div><br><script>var cpro_id/m
  end
end
