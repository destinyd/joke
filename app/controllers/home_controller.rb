class HomeController < ApplicationController
  def index
    @longs = Joke.long.recent.limit(3)
    @shorts = Joke.short.recent.page
  end
end
