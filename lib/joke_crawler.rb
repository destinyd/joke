require 'open-uri'

class JokeCrawler
  def initialize(args={})
    @args = default_params.merge(args)
  end

  def run
    if @args[:all]
      get_all
    else
        get_recent
    end
  end

  def default_params
    @default_params ||= {all: false}
  end

  def url(page=0,timestamp=0,sort=1)
    "http://joke.zaijiawan.com/Joke/joke2.jsp?appname=readingxiaonimei&os=android&hardware=android&version=1.6&sort=#{sort}&timestamp=#{timestamp}&page=#{page}"
  end

  def get(url)
    n = Nokogiri::XML(open(url).read.gsub(regex_wrap,''))
    if n.xpath('//dataend').text == '0'
      n.xpath('//joke').each do |joke|
        Joke.create joke_id: joke.xpath('id').text, name: joke.xpath('name').text, text: joke.xpath('text').text, imgurl: deal_text(joke.xpath('imgurl').text), videourl: deal_text(joke.xpath('videourl').text), forward: joke.xpath('forward').text, tag_list: "短篇,#{[nil,'','0'].include?(joke.xpath('imgurl').text) ? '无图' : '有图'}"
      end
    end
  end

  def get_recent
    get(url(0,0,0))
    get(url)
  end

  def get_all
    n = Nokogiri::XML(open(url).read.gsub(regex_wrap,''))
    @timestamp = n.xpath('//timestamp').text.gsub(/ /, '+')

    (0..522).to_a.reverse.each do |index|
      get(url(index,@timestamp))
    end
  end

  def deal_text(text)
    case text
    when nil
      nil
    when ''
      nil
    when '0'
      nil
    else
      text
    end
  end

  def regex_videourl
    @regex_videourl ||= /.*id_([^\.]+).html.*/
  end

  def regex_wrap
    @regex_wrap ||= /[\r\t\n]/
  end
end
