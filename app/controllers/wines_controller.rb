class WinesController < ApplicationController
  before_action :find_collection, :only => [:index, :new, :create]
  before_action :user_wines, :only => [:show]
  before_action :find_wine, :only => [:destroy, :update, :edit]

  helper_method :set_user, :find_collection, :collection_of_wines, :find_wine, :user_wines, :create_wine

  def new
  end

  def create
    create_wine.save
    redirect_to user_collection_wines_path(set_user.id, find_collection.id)
  end

  def index
    if session[:id].nil?
      @wines = Wine.all
    else
      find_collection
    end
  end

  def show
  end

  def edit
  end

  def update
    find_wine.update(allowed_parameters)
    redirect_to user_collection_wines_path
  end

  def destroy
    find_wine.destroy
    redirect_to user_collection_wines_path
  end

  private

  def find_wine
    if params[:id]
      Wine.find(params[:id])
    else
      Wine.new
    end
  end


  def set_user
    if session[:id]
      User.find(params[:user_id])
    end
  end


  def find_collection
    if session[:id]
      set_user.collections.find(params[:collection_id])
    end
  end


  def create_wine
    collection_of_wines.build(allowed_parameters)
  end

  def collection_of_wines
    find_collection.wines
  end

  def user_wines
    set_user.wines
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