class JokesController < InheritedResources::Base
  protected
  def collection
    @jokes ||= end_of_association_chain.page(params[:page])
  end
end
