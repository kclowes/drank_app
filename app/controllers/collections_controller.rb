class CollectionsController < UsersController
  before_action :set_collection, :only => [:show, :update, :destroy, :new]
  before_action :new_collection, :only => [:create]

  helper_method :new_collection, :set_collections, :set_collection


  def index
  end

  def new
  end

  def create
    if new_collection.save
      redirect_to collections_path(set_collection)
    else
      flash[:notice] = 'Please enter a collection name'
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    set_collection.update(allowed_parameters)
    if set_collection.save
      redirect_to collection_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    set_collection.destroy
    redirect_to collections_path
  end

  private

  def set_collections
    current_user.collections
  end

  def set_collection
    if params[:id]
      Collection.find(params[:id])
    else
      Collection.new
    end
  end

  def new_collection
    current_user.collections.build(allowed_parameters)
  end

  def allowed_parameters
    params.require(:collection).permit(
      :collection_name,
    )
  end
end