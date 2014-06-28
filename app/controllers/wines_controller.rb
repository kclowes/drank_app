class WinesController < ApplicationController
  before_action :find_collection, :only => [:index, :new, :create]
  before_action :user_wines, :only => [:show]
  before_action :find_wine, :only => [:destroy, :update, :edit]

  helper_method :set_user, :find_collection, :collection_of_wines, :find_wine, :user_wines

  def new
    @wine = Wine.new
  end

  def create
    new_wine.save
    redirect_to user_collection_wines_path
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
    Wine.find(params[:id])
  end

  def set_user
    User.find(params[:user_id])
  end

  def find_collection
    set_user.collections.find(params[:collection_id])
  end

  def new_wine
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