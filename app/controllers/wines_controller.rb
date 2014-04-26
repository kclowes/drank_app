class WinesController < ApplicationController

  def new
    @wines = Wine.new
  end

  def create
    @wines = Wine.create(wine_fruit_taste: params[:wine][:wine_fruit_taste],
                wine_sweetness: params[:wine][:wine_sweetness],
                wine_body: params[:wine][:wine_body],
                wine_vintage: params[:wine][:wine_vintage],
                wine_abv: params[:wine][:wine_abv],
                wine_overall_rating: params[:wine][:wine_overall_rating])
    redirect_to wines_path
  end

  def index
    @wines = Wine.all
  end
end