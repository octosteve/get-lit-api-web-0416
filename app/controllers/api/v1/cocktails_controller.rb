module Api
  module V1
    class CocktailsController < ApplicationController
      def index
        render json: Cocktail.includes(:proportions, :ingredients).limit(10), include: ['proportions']
      end

      def create
        binding.pry
        render nothing: true
      end
    end
  end
end
