# coding: utf-8
require 'open-uri'

class BaozoumanhuaCrawler
  def initialize(args={})
  end

  def host
    @host ||= 'http://baozoumanhua.com/'
  end

  def run
    @n = 0
    begin
      get_recent
    rescue Net::ReadTimeout => ex
      p 'QiushibaikeCrawler get html timeout'
      @n += 1
      retry if @n < 3
    end
  end

  def html_urls
    @html_urls ||= [host + '/baozou/hot', host + '/baozou/hot/page/2']
  end

  def get_html(html_url)
    Nokogiri::HTML(open(html_url))
  end

  def get_recent
    name = '暴走漫画'
    html_urls.each do |html_url|
      get_html(html_url).css('.entry-item').each do |item|
        link = item.attr('data-url')
        joke_id = link
        title = item.attr('data-text')
        content = title
        imgurl = nil
        item_img = item.css('.img-wrap img')
        imgurl = item_img.attr('src').text unless item_img.blank?
        videourl = nil
        item_video = item.css('.content embed')
        unless item_video.blank?
          videourl = item_video.attr('src').text
          item_flashvar = item_video.attr('flashvars')
          videourl += "?" +  item_flashvar.text if item_flashvar
        end
        begin
          if videourl
            Joke.create joke_id: joke_id, name: name, text: content, tag_list: '短篇,暴走漫画,视频', videourl: videourl, title: title
          elsif imgurl
            Joke.create joke_id: joke_id, name: name, text: content, tag_list: '短篇,暴走漫画,有图', imgurl: imgurl, title: title
          end
        rescue Exception => ex
          debugger
          p 'BaozoumanhuaCrawler get error:' + link
        end
      end
    end
  end
end
