class CollectionsController < ApplicationController
  before_action :set_collection, :only => [:show, :update, :destroy]
  before_action :new_collection, :only => [:create]

  def index
  end

  def new
  end

  def create
    if new_collection.save
      redirect_to user_collections_path
    else
      flash[:notice] = 'Please enter a collection name'
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    set_collection.update(allowed_parameters)
    redirect_to user_collections_path
  end

  def show
  end

  def destroy
    set_collection.destroy
    redirect_to user_collections_path
  end

  private
  helper_method :set_user, :set_new_collection, :set_collections, :set_collection

  def set_user
    User.find(params[:user_id])
  end

  def set_collections
    set_user.collections
  end

  def set_new_collection
    set_user.collections.build
  end

  def set_collection
    set_user.collections.find(params[:id])
  end

  def new_collection
    set_user.collections.build(allowed_parameters)
  end

  def allowed_parameters
    params.require(:collection).permit(
      :collection_name,
      :user_attributes => [:user_id]
    )
  end
end