module Api
  module V1
    class CocktailsController < ApplicationController
      def index
        render json: Cocktail.includes(:proportions, :ingredients), include: ['proportions']
      end
    end
  end
end
