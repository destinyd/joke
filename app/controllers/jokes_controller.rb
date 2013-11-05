class JokesController < InheritedResources::Base
  def long
    @jokes = Joke.long.recent.page(params[:page])
  end

  def short
    @jokes = Joke.short.recent.page(params[:page])
  end

  def image
    @jokes = Joke.image.recent.page(params[:page])
  end

  protected
  def collection
    @jokes ||= end_of_association_chain.recent.page(params[:page])
  end
end
