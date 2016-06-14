module Api
  module V1
    class CocktailsController < ApplicationController
      def index
        render json: Cocktail.limit(10), include: ['proportions']
      end
    end
  end
end
