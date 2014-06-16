class CollectionsController < ApplicationController

  def index
    if session[:id]
      @user = User.find(session[:id])
    end
    @collection = Collection.all
  end

  def new
    if session[:id]
      @user = User.find(session[:id])
    end
    @collection = Collection.new
  end

  def create
    user = User.find(params[:user_id])
    collection = Collection.new(:user_id => user.id, :collection_name => params[:collection][:collection_name])
    if collection.save
      redirect_to user_collections_path
    else
      flash[:notice] = 'Please enter a collection name'
      redirect_to new_user_collection_path
    end
  end

  def edit
    @collection = Collection.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    collection = Collection.find(params[:id])
    collection.update(:id => params[:id], :collection_name => params[:collection][:collection_name])
    redirect_to user_collection_path
  end

  def show
    @collection = Collection.find(params[:id])
    @user = User.find(session[:id])
  end

  def destroy
    collection = Collection.find(params[:id])
    collection.destroy
    redirect_to user_collections_path
  end
end