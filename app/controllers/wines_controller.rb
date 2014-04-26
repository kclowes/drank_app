class WinesController < ApplicationController

  def new
    @wines = Wine.new
  end

  def create
    @wines = Wine.create(wine_type: params[:wine][:wine_type],
                         wine_fruit_taste: params[:wine][:wine_fruit_taste],
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

  def show
    @wines = Wine.all
  end

  def edit
    id = params[:id]
    @edited_wine = Wine.find(id)
  end

  def update
    wine = Wine.find(params[:id])
    wine.update(wine_type: params[:wine][:wine_type],
                wine_fruit_taste: params[:wine][:wine_fruit_taste],
                wine_sweetness: params[:wine][:wine_sweetness],
                wine_body: params[:wine][:wine_body],
                wine_vintage: params[:wine][:wine_vintage],
                wine_abv: params[:wine][:wine_abv],
                wine_overall_rating: params[:wine][:wine_overall_rating])
    redirect_to wines_path
  end

  def destroy
    wine = Wine.find(params[:id])
    wine.destroy
    redirect_to wines_path
  end
end