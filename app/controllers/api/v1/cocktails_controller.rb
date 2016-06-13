module Api
  module V1
    class CocktailsController < ApplicationController
      def index
        render json: Cocktail.all
      end
    end
  end
end
