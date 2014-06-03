class AddWineNameColumnToWines < ActiveRecord::Migration
  def change
    add_column :wines, :wine_name, :string
  end
end
