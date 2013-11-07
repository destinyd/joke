# coding: utf-8
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
      open(url).read.gsub('http://17qs.qiniudn.com/img/grey.gif','/assets/loading_bar.gif').match(regex_wrap)['content']
  end

  def get_rss
    rss = Nokogiri::XML(open(rss_url))
  end

  def get_recent
    get_rss.xpath('//item').each do |item|
      joke_id =  item.xpath('guid').text
      name = item.xpath('title').text
      link = item.xpath('link').text
      begin
        if is_need?(name, link)
          if regex_short_url.match(link)
            Joke.create joke_id: joke_id, name: name, text: get_cotent(link), tag_list: '短篇,轻松'
          else
            Joke.create joke_id: joke_id, name: name, text: get_cotent(link), tag_list: '长篇,轻松'
          end unless Joke.where(joke_id: joke_id).first
        end
      rescue Exception => ex
        p 'QingsongCrawler get error:' + link
      end
    end
  end

  def is_need?(name, link)
    return true if regex_need_url.match(link) or regex_qingsong_name.match(name)
  end

  def regex_wrap
    @regex_wrap ||= /<div class="news-content.*?">(?<content>.*?)<\/div><br><script>var cpro_id/m
  end

  def regex_need_url
    @regex_need_url ||= /news-(?:\d+$|tucao.*|FUN\d+)/
  end

  def regex_qingsong_name
    @regex_qingsong_name ||= /轻松一刻/
  end

  def regex_short_url
    @regex_short_url ||= /news-\d+$/
  end
end
