class JokesController < InheritedResources::Base
  before_filter :crummy_all
  before_filter :crummy_other, only: [:long, :short, :image, :video]
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
    @jokes = Joke.funlaile.recent.page(params[:page])
    respond_with(@jokes)
  end

  def wufunlaile
    @jokes = Joke.wufunlaile.recent.page(params[:page])
    respond_with(@jokes)
  end

  def wanfunlaile
    @jokes = Joke.wanfunlaile.recent.page(params[:page])
    respond_with(@jokes)
  end

  def jionggeshuoshi
    @jokes = Joke.jionggeshuoshi.recent.page(params[:page])
    respond_with(@jokes)
  end

  protected
  def collection
    @jokes ||= end_of_association_chain.recent.page(params[:page])
  end

  def crummy_all
    add_crumb(I18n.t("action.jokes.index"), jokes_path)
  end

  def crummy_show
    add_crumb(@joke.name) if @joke.is_long?
  end

  def crummy_other
    add_crumb(I18n.t("action.jokes.#{action_name}"), send("#{action_name}_path"))
  end
end
