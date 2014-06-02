# coding: utf-8
require 'open-uri'

class QingsongCrawler
  def initialize(args={})
  end

  def run
    @n = 0
    begin
      get_recent
    rescue Net::ReadTimeout => ex
      p 'QingsongCrawler get rss timeout'
      @n += 1
      retry if @n < 3
    end
  end

  def rss_url
    'http://www.17qingsong.com/rss'
  end

  def get_cotent(url)
    #text = open(url).read.gsub('http://17qs.qiniudn.com/img/grey.gif','/assets/loading_bar.gif').gsub(/<ins[^>]+><\/ins>|<script>[^<]+<\/script>/mi,'').gsub(/17qingsong-23/, 'liuzhouyeshi-23').match(regex_wrap)['content']
    page = Nokogiri::HTML(open(url))
    text = page.css('.news-content').to_html.gsub('http://17qs.qiniudn.com/img/grey.gif','/assets/loading_bar.gif').gsub(/<ins[^>]+><\/ins>|<script>[^<]+<\/script>/mi,'').gsub(/17qingsong-23/, 'liuzhouyeshi-23')
  end

  def get_rss
    rss = Nokogiri::XML(open(rss_url))
  end

  def get_recent
    name = '17轻松'
    get_rss.xpath('//item').each do |item|
      joke_id =  item.xpath('guid').text
      title = item.xpath('title').text
      link = item.xpath('link').text
      begin
        if is_need?(title, link)
          if regex_short_url.match(link)
            tags = ['轻松','短篇']
            Joke.create joke_id: joke_id, title: title, name: name, text: get_cotent(link), tag_list: tags.join(',')
          else
            tags = ['轻松','长篇']
            array_need_qingsong_tags.each do |tag|
              tmp = title.scan tag
              tags.push tmp.first unless tmp.blank?
            end
            tags.compact!
            tags.uniq!
            Joke.create joke_id: joke_id, title: title, name: name, text: get_cotent(link), tag_list: tags.join(',')
          end unless Joke.where(joke_id: joke_id).first
        end
      rescue Exception => ex
        p 'QingsongCrawler get error:' + link
      end
    end
  end

  def is_need?(title, link)
    return true if regex_need_url.match(link) or regex_qingsong_title.match(title)
  end

  def regex_wrap
    @regex_wrap ||= /<div class="news-content.*?">(?<content>.*?)<\/div><div class="gbads center"><script>var cpro_id/m
  end

  def regex_need_url
    @regex_need_url ||= /news-(?:\d+$|tucao.*|FUN\d+|jiongget.*|jiecao\d+|yijiongt.*)/
  end

  def regex_qingsong_title
    @regex_qingsong_title ||= /轻松一刻|内涵图|一囧|囧哥|吐槽/
  end

  def array_need_qingsong_tags
    @array_need_qingsong_tags ||= %w(轻松一刻 内涵图 一日一囧 囧哥说事 神吐槽 FUN来了 晚FUN来了 午FUN来了)
  end

  def regex_short_url
    @regex_short_url ||= /news-\d+$/
  end
end
