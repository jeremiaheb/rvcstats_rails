class Api::StratsController < ApplicationController
  def index
  	@strata = Strat.
    with_strat(query_params[:strat]).
    with_prot(query_params[:prot]).
    with_year(query_params[:year]).
    with_region(query_params[:region])
  end

  private
  	#Whitelist allowed parameters
  	def query_params
  		raise 'prot cannot have more than one argument' if params[:prot].present? && params[:prot].length > 1
  		params.permit(:strat => [], :region => [], :year => [], :prot => [])
  	end
end
