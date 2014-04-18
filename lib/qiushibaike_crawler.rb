# coding: utf-8
require 'open-uri'

class QiushibaikeCrawler
  def initialize(args={})
  end

  def host
    @host ||= 'http://www.qiushibaike.com'
  end

  def article_url(id)
    "#{host}/article/" + id
  end

  def tag_id_to_article_url(tag_id)
    tag_id.gsub(/qiushi_tag_(\d+)/, '\1')
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

  def html_url
    @html_url ||= host + '/8hr'
  end

  def get_html
    Nokogiri::HTML(open(html_url))
  end

  def get_recent
    name = '糗事百科'
    get_html.css('.article').each do |item|
      link = tag_id_to_article_url(item.attr('id'))
      joke_id = link
      content = Joke.strip(item.css('.content').text)
      imgurl = nil
      item_img = item.css('.thumb img')
      imgurl = item_img.attr('src').text unless item_img.blank?
      begin
        if imgurl
          Joke.create joke_id: joke_id, name: name, text: content, tag_list: '短篇,有图,糗事百科', imgurl: imgurl
        else
          Joke.create joke_id: joke_id, name: name, text: content, tag_list: '短篇,糗事百科'
        end
      rescue Exception => ex
        p 'QiushibaikeCrawler get error:' + link
      end
    end
  end
end

