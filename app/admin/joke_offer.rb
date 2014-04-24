ActiveAdmin.register JokeOffer do
  member_action :approved do
    joke_offer = JokeOffer.find(params[:id])
    joke_offer.approved!
    redirect_to({action: :index}, {:notice => "已审核!"})
  end

  member_action :declined do
    joke_offer = JokeOffer.find(params[:id])
    joke_offer.declined!
    redirect_to({action: :index}, {:notice => "已悲剧!"})
  end

end
