require 'net/http'
require 'uri'

class Yixin
  API_URL = 'https://api.yixin.im/cgi-bin/'
  TOKEN_PATH_FORMAT = 'token?grant_type=client_credential&appid=%s&secret=%s'
  SEND_PATH_FORMAT = 'message/group/send?access_token=%s'

  URL_FORMAT = 'http://joke.realityandapp.com/jokes/%s'

  def token_url
    @token_url ||= API_URL + TOKEN_PATH_FORMAT % [ENV['YIXIN_APPID'], ENV['YIXIN_SECRET']]
  end

  def send_url
    @send_url ||= API_URL + SEND_PATH_FORMAT % token
  end

  def token
    @token ||= JSON.parse(open(token_url).read)['access_token']
  end

  def post_jokes(jokes)
    hash = {
      msgtype: 'news',
      news:{ 
        articles: jokes.map{|joke|
        {
          title: joke.title,
          description: joke.description,
          url: URL_FORMAT % joke.id,
          picurl: joke.is_image? ? joke.imgurl : nil
        }
      }
      }
    }
    p hash
    res = Net::HTTP.post_form URI(send_url),
      hash
    p res.body
  end
end
