class JokesController < InheritedResources::Base
  before_filter :crummy_all
  before_filter :crummy_other, only: [:long, :short, :image, :video]
  before_filter :crummy_tag, only: [:tag]
  respond_to :html, :json
  actions :index, :show

  def show
    show! do 
      crummy_show
      @joke.visit!
    end
  end

  def long
    @jokes = Joke.long.recent.page(params[:page])
    respond_with(@jokes)
  end

  def short
    @jokes = Joke.short.recent.page(params[:page])
    respond_with(@jokes)
  end

  def image
    @jokes = Joke.image.recent.page(params[:page])
    respond_with(@jokes)
  end

  def video
    @jokes = Joke.video.recent.page(params[:page])
    respond_with(@jokes)
  end

  def funlaile
    redirect_to tag_url('FUN来了'), status: 301
    #@jokes = Joke.funlaile.recent.page(params[:page])
    #respond_with(@jokes)
  end

  def wufunlaile
    redirect_to tag_url('午FUN来了'), status: 301
    #@jokes = Joke.wufunlaile.recent.page(params[:page])
    #respond_with(@jokes)
  end

  def wanfunlaile
    redirect_to tag_url('晚FUN来了'), status: 301
    #@jokes = Joke.wanfunlaile.recent.page(params[:page])
    #respond_with(@jokes)
  end

  def jionggeshuoshi
    redirect_to tag_url('囧哥说事'), status: 301
    #@jokes = Joke.jionggeshuoshi.recent.page(params[:page])
    #respond_with(@jokes)
  end

  def tag
    @tag = params[:id]
    @jokes = Joke.tagged_with_on(:tags, @tag).recent.page(params[:page])
    respond_with(@jokes)
  end

  protected
  def collection
    @jokes ||= end_of_association_chain.recent.page(params[:page])
  end

  def crummy_all
    add_crumb(I18n.t("action.jokes.index"), jokes_url)
  end

  def crummy_show
    add_crumb(@joke.name) if @joke.is_long?
  end

  def crummy_other
    add_crumb(I18n.t("action.jokes.#{action_name}"), send("#{action_name}_url"))
  end

  def crummy_tag
    add_crumb(params[:id], tag_url(params[:id]))
  end
end
