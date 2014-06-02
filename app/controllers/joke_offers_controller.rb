class JokeOffersController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :crummy_all
  actions :index, :show, :create, :new

  def show
    show! do 
      crummy_show
    end
  end
  
  # for admin
  def list
    @joke_offers = JokeOffer.pending.recent.page(params[:page])
    render :index
  end

  def approved
    @joke_offer = JokeOffer.find(params[:id])
    @joke_offer.approved!
    redirect_to @joke_offer
  end

  def declined
    @joke_offer = JokeOffer.find(params[:id])
    @joke_offer.declined!
    redirect_to @joke_offer
  end
  # for admin end
  protected
  def begin_of_association_chain
    current_user
  end

  def collection
    @joke_offers ||= end_of_association_chain.recent.page(params[:page])
  end

  def crummy_all
    add_crumb(I18n.t("action.joke_offers.index"), joke_offers_url)
  end

  def crummy_show
    add_crumb(@joke_offer.human_title)
  end
end
