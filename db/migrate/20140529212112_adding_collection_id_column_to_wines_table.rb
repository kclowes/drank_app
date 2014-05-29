class AddingCollectionIdColumnToWinesTable < ActiveRecord::Migration
  def change
    add_column :wines, :collection_id, :integer
  end
end
