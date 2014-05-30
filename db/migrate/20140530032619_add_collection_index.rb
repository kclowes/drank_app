class AddCollectionIndex < ActiveRecord::Migration
  def change
    add_index :wines, :collection_id
  end
end
