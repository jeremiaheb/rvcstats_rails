class Apiv2::AnimalsController < ApplicationController
  def index
    @species = Animal.where(query_params)
  end

  private
    def query_params
      params.permit(:id => [], :species_cd => [], :sciname => [], :comname => []);
    end
end
