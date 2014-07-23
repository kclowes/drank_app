class WinesController < ApplicationController
  # before_action :find_collection, :only => [:new, :create]
  before_action :find_wine, :only => [:destroy, :update, :edit]

  helper_method :find_collection, :collection_of_wines, :find_wine, :user_wines, :set_wine_collection

  def index
    @wines = current_user ? current_user.wines : Wine.all
    # if session[:id].nil?
    #   @wines = Wine.all
    # else
    #   find_collection
    # end
  end

  def new; end

  def create
    create_wine.save
    redirect_to collection_path(set_wine_collection)
  end

  def show; end

  def edit; end

  def update
    find_wine.update(allowed_parameters)
    redirect_to collection_path(set_wine_collection)
  end

  def destroy
    find_wine.destroy
    redirect_to collection_path(set_wine_collection)
  end

  private

  def find_wine
    if params[:id]
      Wine.find(params[:id])
    else
      Wine.new
    end
  end

  def create_wine
    collection_of_wines.build(allowed_parameters)
  end

  def set_wine_collection
    Collection.find(params[:collection_id])
  end

  def collection_of_wines
    set_wine_collection.wines
  end

  def allowed_parameters
    params.require(:wine).permit(
      :wine_type,
      :wine_fruit_taste,
      :wine_sweetness,
      :wine_body,
      :wine_vintage,
      :wine_abv,
      :wine_overall_rating,
      :wine_image,
      :wine_name,
      :collection_attributes =>
        [:collection_id]
    )
  end


end