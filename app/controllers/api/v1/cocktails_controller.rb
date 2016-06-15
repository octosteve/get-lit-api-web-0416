module Api
  module V1
    class CocktailsController < ApplicationController
      def index
        render json: Cocktail.includes(:proportions, :ingredients), include: ['proportions']
      end

      def create
        cocktail = CreateCocktail.call(cocktail_params, proportions_params)
        render json: cocktail, include: ["proportions"]
      end

      private
      def cocktail_params
        params.require(:data).require(:attributes).permit(:name, :description, :source, :instructions)
      end

      def proportions_params
        params
          .require(:data)
          .require(:proportions)
          .map { |proportion| proportion["data"]["attributes"]  }
      end
    end
  end
end
