class SitemapPagesController < ApplicationController
  caches_action :index, expires_in: 1.day, cache_path: Proc.new {|c| c.request.url }
  def index
    @jokes = Joke.page(params[:page]).per(1000)
    add_crumb(I18n.t("action.sitemap_pages.index"), sitemap_pages_path)
    add_crumb(I18n.t("action.sitemap_pages.page", page: params[:page] || 1))
  end
end
