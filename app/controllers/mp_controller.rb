class MpController < ApplicationController
  require 'digest/sha1'
  skip_before_filter :verify_authenticity_token

  def yixin
    a = ['ddjoke', params[:timestamp], params[:nonce]]
    b = a.partition{|x| x.is_a? String}.map(&:sort).flatten
    unless Digest::SHA1.hexdigest(b.join) == params[:signature]
      render :text => "Forbidden", :status => 403
    end
    if params[:xml][:MsgType] == 'event'
      case params[:xml][:Event]
      when 'CLICK'
        @jokes = Joke.recent.page.per(5).not_in(id: YixinRead.get_user(params[:xml][:FromUserName]).joke_ids)
        if %w(image video long).include?(params[:xml][:EventKey])
          @jokes = @jokes.send(params[:xml][:EventKey])
        end
      else
        render :welcome
      end
    else
      render :welcome
    end
  end

  #before_filter :check_weixin_legality

  #private
  #def check_weixin_legality
  #array = [Rails.configuration.weixin_token, params[:timestamp], params[:nonce]].sort
  #render :text => "Forbidden", :status => 403 if params[:signature] != Digest::SHA1.hexdigest(array.join)
  #end
end

