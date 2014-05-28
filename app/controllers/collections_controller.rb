class CollectionsController < ApplicationController
  def show
  end

  def index
    id = session[:id]
    @user = User.find(id)
    @collection = Collection.all
  end

  def new
    @users = User.find(session[:id])
    @collections = Collection.new
  end

  def create
    @collection = Collection.new(:user_id => params['user_id'], :collection_name => params[:collection][:collection_name])
    if @collection.save
      redirect_to user_collections_path
    else
      render new_user_collection_path
    end
  end

  def show
    @collection = Collection.find(params[:id])
    @user = User.find(session[:id])
  end
end