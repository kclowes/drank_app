class CollectionsController < ApplicationController
  def show
  end

  def index
    id = session[:id]
    if session[:id]
      @user = User.find(id)
    end
    @collection = Collection.all
  end

  def new
    if session[:id]
      @user = User.find(session[:id])
    end
    @users = User.find(session[:id])
    @collections = Collection.new
  end

  def create
    @collection = Collection.new(:user_id => params['user_id'], :collection_name => params[:collection][:collection_name])
    if @collection.save
      redirect_to user_collections_path
    else
      @error = 'Please Fill in the Collection Name'
      render '/users/:user_id/collections/:collection_id/new'
    end
  end

  def edit
    @collection = Collection.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    collection = Collection.find(params[:id])
    collection.update(:id => params[:id], :collection_name => params[:collection][:collection_name])
    redirect_to user_collections_path
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